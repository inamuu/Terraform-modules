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

style VPC fill:#c96
style Public fill:#696
style Private fill:#696
style Public-1a fill:#69a
style Public-1c fill:#69a
style Private-1a fill:#69a
style Private-1c fill:#69a
style InternetGateway fill:#69a
linkStyle 0 stroke:#fff,stroke-width:0px
linkStyle 1 stroke:#fff,stroke-width:0px
```