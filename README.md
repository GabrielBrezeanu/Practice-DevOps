# Pentalog-DevOps

## Multi container apps
eg:

<img src="https://docs.docker.com/get-started/images/multi-app-architecture.png"
     alt="Two container app"
     style="float: center; margin-right: 10px;" />

- https://docs.docker.com/get-started/07_multi_container/

### :exclamation: Container networking: 
Remember that containers, by default, run in isolation and don’t know anything about other processes or containers on the same machine. So, how do we allow one container to talk to another? The answer is networking. Now, you don’t have to be a network engineer (hooray!). <br> Simply remember this rule...

#### :exclamation: Note

:exclamation: If two containers are on the same network, they can talk to each other. If they aren’t, they can’t. <br>

<p>Latest updates: </p><br>
<p>Added postgresql and django containers and make them working together. Also added an elasticsearch and kibana container.</p><br>
<p>Worked with a requirements file, researched and fixed a lot of errors.(still got some)</p><br>