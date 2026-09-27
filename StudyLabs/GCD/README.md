# Laboratório GCD — Substi

Este executável é material de estudo independente. Ele não faz parte do target
do app e GCD não é o modelo de concorrência do fluxo principal do Substi.

## Executar

```sh
DEVELOPER_DIR=/path/to/Xcode.app/Contents/Developer \
  xcrun swiftc -parse-as-library -swift-version 6 -warnings-as-errors \
  StudyLabs/GCD/GCDStudyLab.swift \
  -o /tmp/substi-gcd-study-lab
/tmp/substi-gcd-study-lab
```

## Mapa dos exercícios

```text
DispatchQueue serial      → uma tarefa por vez, ordem FIFO
DispatchQueue concurrent  → tarefas podem se sobrepor; ordem de término varia
QoS                       → comunica prioridade relativa ao sistema
sync / async              → esperar pelo resultado / enfileirar e continuar
DispatchGroup             → acompanhar conclusão de várias operações
barrier                   → exclusão entre tarefas de uma fila concurrent própria
NSLock                    → proteger o contador compartilhado do exercício
TaskGroup                 → contraste com concorrência estruturada de Swift
```

### Filas e ordem

Uma fila serial é como uma fila única de atendimento: começa a próxima tarefa
depois que a atual termina. Uma fila concurrent pode atender várias ao mesmo
tempo; não se deve depender da ordem em que elas terminam.

### QoS

QoS comunica ao sistema a importância relativa do trabalho. `userInitiated` é
adequado a trabalho necessário para concluir uma ação que a pessoa acabou de
pedir; `utility` descreve trabalho útil que pode continuar em segundo plano.
QoS não é um cronograma nem uma promessa de ordenação.

### `sync` e `async`

`sync` só retorna depois que o bloco termina e pode bloquear o chamador.
`async` agenda o bloco e retorna. Chamar `sync` na mesma fila serial em que o
bloco atual está executando cria deadlock:

```swift
let queue = DispatchQueue(label: "deadlock-example")
queue.async {
    queue.sync { // Não executar: espera por um bloco que não pode começar.
        print("nunca alcançado")
    }
}
```

O exemplo fica documentado, não executado, para não travar o laboratório.

### `DispatchGroup` e `barrier`

O grupo representa “aguardar todos os trabalhos deste conjunto”. `wait` bloqueia
a thread chamadora; por isso, não deve ser usado na main thread de uma interface.
O exemplo de terminal usa um timeout como proteção contra travamento, não como
atraso artificial. Uma barrier numa fila concurrent criada pela aplicação
espera as operações anteriores e impede as posteriores de começar até terminar.
Uma barreira numa fila global não oferece essa garantia de exclusão.

### Race condition

Uma race ocorre quando operações concorrentes acessam estado compartilhado e o
resultado depende da ordem não controlada. Por exemplo, incrementar `counter`
sem sincronização pode perder atualizações. O executável mostra a versão
protegida: `LockedCounter` usa `NSLock` em toda leitura e escrita. O tipo usa
`@unchecked Sendable` apenas no laboratório porque a segurança depende do
invariante manual do lock; isso exige revisão cuidadosa e não é uma receita para
silenciar o compilador em código de produção. Thread Sanitizer pode detectar a
versão insegura quando ela é executada num experimento separado.

### GCD e Swift Concurrency

`DispatchGroup` acompanha trabalhos de callback e permite integração com APIs
baseadas em GCD. `TaskGroup` cria tarefas filhas estruturadas: elas herdam o
escopo de vida do pai, retornam valores tipados e participam do cancelamento.
Para novas operações assíncronas no produto, o Substi prefere `async/await` e
Swift Concurrency. Misturar os modelos exige uma fronteira clara, especialmente
para propagação de cancelamento, erros e isolamento de dados.

## O que observar ao executar

- Tarefas serializadas preservam a ordem de enfileiramento.
- Tarefas concorrentes podem terminar em ordens diferentes entre execuções.
- QoS não determina a ordem dos prints.
- A mensagem após `DispatchGroup.wait` aparece depois de todas as tarefas.
- O contador termina em 1000 porque cada incremento é protegido pelo lock.
- Os resultados do `TaskGroup` são ordenados apenas para tornar a saída estável;
  a ordem em que as tarefas terminam não é garantida.
