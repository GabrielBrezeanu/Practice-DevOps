# Pentalog-DevOps

## 2. Multi container apps

<img src="https://docs.docker.com/get-started/images/multi-app-architecture.png"
     alt="Two container app"
     style="float: center; margin-right: 10px;" />

- https://docs.docker.com/get-started/07_multi_container/

### :exclamation: Container networking: 
Remember that containers, by default, run in isolation and don’t know anything about other processes or containers on the same machine. So, how do we allow one container to talk to another? The answer is networking. Now, you don’t have to be a network engineer (hooray!). Simply remember this rule...

#### :exclamation: Note

:exclamation: If two containers are on the same network, they can talk to each other. If they aren’t, they can’t.