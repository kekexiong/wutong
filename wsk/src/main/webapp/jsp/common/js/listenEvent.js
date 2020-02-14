/**
 * rc环境
 * 全局捕获button，a，input[type=button]事件
 */
$(document).ready(function () {
    var sysButton = document.getElementsByTagName("button");
    var sysHref = document.getElementsByTagName("a");
    var sysInputButton = document.getElementsByTagName("input");
    var initIframe = document.createElement('iframe');
    initIframe.src = 'https://172.16.133.99/sys-iframe.html';
    initIframe.style.display = 'none';
    initIframe.onload = function() {
        setTimeout(function(){
            initIframe.remove();
        }, 2000)
    }
    document.body.appendChild(initIframe);
    for(var i = 0; i < sysButton.length; i++) {
        sysButton[i].addEventListener("click",function() {
            var i = document.createElement('iframe');
            i.src = 'https://172.16.133.99/sys-iframe.html';
            i.style.display = 'none';
            i.onload = function() {
                setTimeout(function(){
                    i.remove();
                }, 2000)
            }
            document.body.appendChild(i);
        }, false);
    }
    for(var j = 0; j < sysHref.length; j++) {
        sysHref[j].addEventListener("click",function() {
            var i = document.createElement('iframe');
            i.src = 'https://172.16.133.99/sys-iframe.html';
            i.style.display = 'none';
            i.onload = function() {
                setTimeout(function(){
                    i.remove();
                }, 2000)
            }
            document.body.appendChild(i);
        }, false);
    }
    for(var s = 0; s < sysInputButton.length; s++) {
        if(sysInputButton[s].type === 'button') {
            sysInputButton[s].addEventListener("click",function() {
                var i = document.createElement('iframe');
                i.src = 'https://172.16.133.99/sys-iframe.html';
                i.style.display = 'none';
                i.onload = function() {
                    setTimeout(function(){
                        i.remove();
                    }, 2000)
                }
                document.body.appendChild(i);
            }, false);
        }
    }
})
