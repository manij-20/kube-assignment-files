function getData(){

fetch("http://3.110.198.236:32503")

.then(response => response.text())

.then(data => {
document.getElementById("result").innerHTML=data
})

.catch(error => {
document.getElementById("result").innerHTML="Error connecting backend"
})

}
