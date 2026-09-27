import Dispatch
import Foundation

/// Executável de estudo. Este arquivo não pertence ao target do app iOS.
@main
enum GCDStudyLab {
    static func main() async {
        print("=== Serial e concurrent queues ===")
        demonstrateQueueOrdering()

        print("\n=== Quality of Service ===")
        demonstrateQualityOfService()

        print("\n=== sync e async ===")
        demonstrateSyncAndAsync()

        print("\n=== DispatchGroup ===")
        demonstrateDispatchGroup()

        print("\n=== Barrier ===")
        demonstrateBarrier()

        print("\n=== Proteção contra race condition ===")
        demonstrateSynchronizedState()

        print("\n=== TaskGroup para comparação ===")
        await demonstrateTaskGroup()
    }

    private static func demonstrateQueueOrdering() {
        let serialQueue = DispatchQueue(label: "substi.study.serial")
        for number in 1...3 {
            serialQueue.async {
                print("serial: tarefa \(number)")
            }
        }
        serialQueue.sync {
            print("serial: barreira de observação após as três tarefas")
        }

        let concurrentQueue = DispatchQueue(
            label: "substi.study.concurrent",
            attributes: .concurrent
        )
        let concurrentGroup = DispatchGroup()
        for number in 1...3 {
            concurrentQueue.async(group: concurrentGroup) {
                print("concurrent: tarefa \(number), ordem não garantida")
            }
        }
        concurrentGroup.wait()
        print("concurrent: as três tarefas terminaram")
    }

    private static func demonstrateQualityOfService() {
        let userInitiatedQueue = DispatchQueue(
            label: "substi.study.user-initiated",
            qos: .userInitiated
        )
        let utilityQueue = DispatchQueue(
            label: "substi.study.utility",
            qos: .utility
        )

        userInitiatedQueue.async {
            print("userInitiated: trabalho necessário para uma ação imediata")
        }
        utilityQueue.async {
            print("utility: trabalho útil que pode concluir em segundo plano")
        }
        userInitiatedQueue.sync {}
        utilityQueue.sync {}
        print("QoS comunica prioridade; não promete ordem nem horário exato")
    }

    private static func demonstrateSyncAndAsync() {
        let queue = DispatchQueue(label: "substi.study.sync-async")
        queue.async {
            print("async: enfileirado e executado pela fila")
        }
        queue.sync {
            print("sync: chamador espera; a fila preserva a ordem FIFO")
        }
    }

    private static func demonstrateDispatchGroup() {
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .utility)

        for label in ["produtos", "preços", "categorias"] {
            group.enter()
            queue.async {
                defer { group.leave() }
                print("concluído: \(label)")
            }
        }

        let result = group.wait(timeout: .now() + 10)
        print(result == .success ? "grupo: todas terminaram" : "grupo: timeout")
    }

    private static func demonstrateBarrier() {
        let queue = DispatchQueue(
            label: "substi.study.barrier",
            attributes: .concurrent
        )
        let group = DispatchGroup()

        for number in 1...3 {
            queue.async(group: group) {
                print("leitura anterior \(number) terminou")
            }
        }
        queue.async(group: group, flags: .barrier) {
            print("barrier: região exclusiva para uma escrita")
        }
        queue.async(group: group) {
            print("leitura posterior começa depois da barrier")
        }
        group.wait()
    }

    private static func demonstrateSynchronizedState() {
        let counter = LockedCounter()
        DispatchQueue.concurrentPerform(iterations: 1_000) { _ in
            counter.increment()
        }
        print("contador sincronizado: \(counter.value) (esperado: 1000)")
    }

    private static func demonstrateTaskGroup() async {
        let doubledValues = await withTaskGroup(of: Int.self) { group in
            for value in 1...3 {
                group.addTask { value * 2 }
            }

            var results: [Int] = []
            for await result in group {
                results.append(result)
            }
            return results.sorted()
        }

        print("TaskGroup: resultados concorrentes estruturados \(doubledValues)")
    }
}

/// O estado fica protegido pelo mesmo lock em todas as leituras e escritas.
/// `@unchecked Sendable` é necessário porque o compilador não verifica esse
/// invariante interno; esta classe existe apenas para o exercício de GCD.
private final class LockedCounter: @unchecked Sendable {
    private let lock = NSLock()
    private var storedValue = 0

    var value: Int {
        lock.lock()
        defer { lock.unlock() }
        return storedValue
    }

    func increment() {
        lock.lock()
        defer { lock.unlock() }
        storedValue += 1
    }
}
