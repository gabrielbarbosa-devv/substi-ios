# Critérios globais de conclusão

Terminar a implementação não basta para marcar uma tarefa como `DONE`. Primeiro, mova-a para `REVIEW`. Gabriel revisa comportamento, evidências, explicação e trade-offs; só então aprova `DONE`.

Para tasks de implementação, aplique os itens pertinentes:

- [ ] Comportamento exigido implementado dentro do escopo.
- [ ] Build passa e warnings foram compreendidos.
- [ ] Testes relevantes passam; nenhum teste depende de API ao vivo.
- [ ] SwiftLint passa quando estiver configurado e for aplicável.
- [ ] Ownership, ARC e capturas de closure foram revisados.
- [ ] Concorrência, isolamento, cancelamento e riscos de data race foram revisados.
- [ ] Acessibilidade foi revisada para interfaces visíveis ao usuário.
- [ ] Observabilidade e privacidade foram consideradas.
- [ ] Documentação, ADR e registro de desenvolvimento com IA foram atualizados quando pertinentes.
- [ ] Gabriel consegue explicar solução, alternativas e trade-offs.
- [ ] Achados da revisão foram resolvidos; marcar `DONE` somente após aprovação.

Em tasks de descoberta, estudo ou documentação, verificações exclusivas de implementação não se aplicam. Apresente evidências revisadas para os critérios de aceite da tarefa.
