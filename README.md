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

###Task with * . Write script to show which pages Google checked from the website 

