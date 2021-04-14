## Basic work with files

### Create directory test1
```console
-mkdir test1
```

### Create file test1.txt inside the test1 directory.
```console
-cd test1/
-cat > test1.txt
```

###   Create copy of folder test1 with name test2.  
```console
-cp test1 test2
```

###    Delete file test1.txt inside test2 directory.
```console
-rm test2/test1.txt
```

###    Rename test2 folder into directory_without_file
```console
mv test2 directory_without_file
```

###    Insert 'test1' text into test1/test1.txt file.
```console
cat > test1/test1.txt
```

###    print the text from the test1/test1.txt file.
```console
cat test1/test1.txt
```

###    Insert 'test2' into the end of test1/test1.txt file.
```console
-cat >> test1/test1.txt
test2
```

###    print the text from the test1/test1.txt file.
```console
-cat test1/test1.txt
```

## Permissions

###   1. Create test directory and block access for all to it.

```console
mkdir test
chmod 000 test/
```

###   2. Try to remove that directory.

```console
rm -rf test/
```

###   3. Create simple script which prints current date. Try to execute it.

```console
#!/bin/bash

date 
```

## Log checking

### 1. Count lines in the file test.txt.

```console
wc -l test.txt
200 test.txt
```

### 2. Show last 3 lines from the test.txt file. 

```console
tail -n 3 test.txt
75.127.11.5 - - [02/Apr/2021:04:11:03 -0500] "GET /index.php/using-joomla/extensions/components/users-component/login-form HTTP/1.1" 301 707 "http://riuconstructora.com.do/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/B08C390C"
114.119.145.5 - - [02/Apr/2021:04:11:21 -0500] "GET /tanix-shop/14479wfzr4606990.htm HTTP/1.1" 404 708 "-" "Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)"
114.119.137.70 - - [02/Apr/2021:04:12:55 -0500] "GET /tokka-com/19577wfzr4989999040074.htm HTTP/1.1" 404 708 "-" "Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)"

```

### 3. Hom many uniq IP addresses accessed the website ? 

```console
cat test.txt | sort | uniq -c -w20 | wc -l
64
```

### 4. IP address with most requests.

```console
sort test.txt | uniq -c -w20 | sort -rn | head -n 5
 16 114.119.140.234 - - [02/Apr/2021:01:06:55 -0500] "GET /?option=com_k2&view=itemlist&task=user&id=50239 HTTP/1.1" 301 707 "-" "Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)"
     15 114.119.141.77 - - [02/Apr/2021:01:04:56 -0500] "GET /x-sell/5664cmnz42433095.htm HTTP/1.1" 404 708 "-" "Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)"
     14 114.119.154.237 - - [02/Apr/2021:01:08:58 -0500] "GET /importfan/36378zykpjim4032897.htm HTTP/1.1" 404 708 "-" "Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)"
     13 114.119.137.70 - - [02/Apr/2021:00:57:03 -0500] "GET /dentaro/15140jcgr1706414.htm HTTP/1.1" 404 708 "-" "Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)"
     12 114.119.130.151 - - [02/Apr/2021:00:51:29 -0500] "GET /tantan/7932cgui2083898.htm HTTP/1.1" 404 708 "-" "Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://aspiegel.com/petalbot)"

```

### 5. Most popular link on webiste ? 

```console
awk '{print $7}' test.txt | uniq -c -w20 | sort -rn | head -n 1
2 /robots.txt
```

### 6. Top 3 IP addresses by amount of POST requests.

```console
grep -i 'post' test.txt 

```

### 7. Which IP addresses recived 403 error ? 

```console
awk '{print $9}' test.txt | grep '403'

```

### Task with * . Write script to show which pages Google checked from the website 

## KUBER

### Dockerfile with image description:

1. Launch web-server on 8000 port (with any means necessary)

We need to copy default configs into container with next commands

```console
COPY default.conf /etc/nginx/conf.d/default.conf #  copy default nginx conf from pc into container folder /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/nginx.conf # copy nginx conf from pc into container folder /etc/nginx

```
Now we need to edit default.conf:

- change port we'r listening to 8000

```console
listen       8000;

```

- change root folder to /app 

```console
root   /app;

```
Next lets add next parameter to nginx.conf file:

```console
include /etc/nginx/conf.d/*.conf;

```

2. Pass the /app folder content into the container
(if there is a homework.html file in app folder, it must be reachable via URL http://localhost:8000/homework.html)

In previous part we already made /app root folder, now we just need to fill it and keep in project directory

- After the Dockerfile is ready:
In root repository cready kubernetesintro/web folder and put the Dockerfile inthere.
Build an image from Dockerfile and push it to the Container Registry (Docker Hub for example)

To build an image we need to execute next command 

```console
docker build -t webserver .
```

Now we need to prepare image for pushing :

```console
docker tag webserver mr4ilintan/webserver
```

log in into registry:

```console
docker login
```
and push:

```console
docker push mr4ilintan/webserver
```
- Create web-pod.yaml manifest which creates pod web with app label, with web name, consists of one web container. You have to use image you pushed to Docker Hub before.
You can use the following template:

```yaml
apiVersion: v1 # API version
kind: Pod # Object, which we create 
metadata:
name: # Pod name
labels: # Format key: value labels
key: value
spec: # Pod description
containers: # Pod's containers description
- name: # Container name
image: # Image, from which we create container
```

- Place web-pod.yaml into kubernetesintro and use it:
In namespace default cluster a new pod web should appear:

```console
kubectl apply -f web-pod.yaml
kubectl get pods
```

- In Kubernetes there is an ability to get manifest from running pod.
Except pod description there will be different service field (for exmaple different statuses).

```console
kubectl get pod web -o yaml
```

- One more way to check running pod description is describe.  
 Command lets you see object status and events, which happend to pod.

```console
kubectl describe pod web
```

- kubectl describe - is a nice start to look for issue reasons with launching. 
Indicate a non-existing tag image in manifest and appy it once more (kubectl apply -f web-pod.yaml).    
Pod status (kubectl get pods) should change to ErrImagePull/ImagePullBackOff, and kubectl describe pod web command will let us help why it did:

```console
Events:
Type Reason Age From Message
---- ------ ---- ---- -------
Warning Failed 2s kubelet, minikube Failed to pull image "web:broken-tag": rpc
error: code = Unknown desc = Error response from daemon: manifest for web:broken-tag not
found
```
- Lets add into our pod line, which generetes index.html file.
Init containers are described the same as common containers in pod.  
Add into web-pod.yaml manifest init container description, which states next:
Containers image init should content wget (For example busybox:1.31.0 or any up to date version)  
Containers command init (ENTRYPOINT analog in Dockerfile) type next:

```console
['sh', '-c', 'wget -O- https://tinyurl.com/otus-k8s-intro | sh']
```

- Volumes  
To let files, created in init container, be accessed for main container in pod we need to use type emptyDir volume.   
Both container and init container must be described:
```yaml
volumeMounts of the following kind
volumeMounts:
- name: app
mountPath: /app
```
volume should be described in pod spec

```yaml
volumes:
- name: app
emptyDir: {}
```

- Delete running pod web from cluster (kubectl delete podweb) and apply renewd web-pod.yaml manifest.
To track down whats happening to pod you can use kubectl get pods -w command.

Should be similar output : 

```console
kubectl apply -f web-pod.yaml && kubectl get pods -w
pod/web created
NAME READY STATUS RESTARTS AGE
web 0/1 Init:0/1 0 0s
web 0/1 Init:0/1 0 1s
web 0/1 PodInitializing 0 2s
web 1/1 Running 0 3s
```

- TEST

Lets check if web server works 

```console
kubectl port-forward --address 0.0.0.0 pod/web 8000:8000
```  
If everything done right, a new page should be opened via http://localhost:8000/index.html URL.

## Kubernetes controllers

To start with, lets install kind and create cluster.

We will be using the following configuration for our local cluster - kind-config.yaml:

```yaml
kind: Cluster
apiVersion: kind.sigs.k8s.io/v1alpha3
nodes:
- role: control-plane
- role: control-plane
- role: control-plane
- role: worker
- role: worker
- role: worker
```

Launch kind cluster creation :

After command execution there must be a successful output, about creating 3 master nodes and 3 worker nodes:

```console
$ kind create cluster --config kind-config.yaml

$ kubectl get nodes
```

Перейдем к приложению Hipster Shop. 
Начнем с микросервиса frontend. Его исходный код доступен [тут](https://github.com/GoogleCloudPlatform/microservices-demo/tree/master/src/frontend)  
- Склонируйте [репозиторий](https://github.com/GoogleCloudPlatform/microservices-demo) и соберите собственный образ для frontend (используйте готовый Dockerfile)
- Поместите собранный образ на Docker Hub
