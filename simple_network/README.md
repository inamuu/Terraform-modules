Simple Network
===

```mermaid
graph RL
    subgraph VPC
        InternetGateway
         subgraph Public
             Public-1a --- Public-1c
         end
         subgraph Private
             Private-1a --- Private-1c
         end
    end

style VPC fill:#9cc
style Public fill:#fcc
style Private fill:#fcc
style Public-1a fill:#fc0
style Public-1c fill:#fc0
style Private-1a fill:#fc0
style Private-1c fill:#fc0
style InternetGateway fill:#fc0
linkStyle 0 stroke:#fff,stroke-width:0px
linkStyle 1 stroke:#fff,stroke-width:0px
```