<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	System.out.println(path);
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(basePath);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <script type="text/javascript" src="<%=basePath%>resource/jquery-1.8.3.min.js"></script>
     </head>   
<body>

 
<script type="text/javascript">
 //æµè¯controlleræ¯å¦å¯ä»¥è¿å¥
  
/*  ajaxDo("/ActiveClient/index",null);
 function ajaxDo(url,data){
 	 $.ajax({
 	        url:url ,
 	        type: "post",
 	        dataType: "json",
 	        data: data,
 	        success:function(result){
 	           if(result.success){
 	        	   alert(result.data);
 	           }else{
 	        	   alert(result.msg);
	           }
 	        }
 	    });
 }	 */


//--------------------------------- webSocket ----------------------------------------------
  initSocket("user");

  

function initSocket(myWebsocket) {
	
	var webSocket = null;
	
    window.onbeforeunload = function () {
    	 //离开页面时的其他操作 
    };

    if (!window.WebSocket) {
        console("您的浏览器不支持websocket！");
        return false;
    }

    var target = 'ws://127.0.0.1:8081/Client/websocket/'+myWebsocket;  
   // var target = 'ws://' + window.location.host + "/Client/websocket/"+myWebsocket;   
		if ('WebSocket' in window) {  
			webSocket = new WebSocket(target);  
		} else if ('MozWebSocket' in window) {  
			webSocket = new MozWebSocket(target);  
		} else {  
		    alert('WebSocket is not supported by this browser.');  
		    return;  
		}  
    
    
		// 收到服务端消息  
    webSocket.onmessage = function (msg) {
            alert(msg.data);
         // 关闭连接  
        webSocket.onclose();
        console.log(msg);
    };

    // 异常  
    webSocket.onerror = function (event) {
        console.log(event);
    };

    // 建立连接  
    webSocket.onopen = function (event) {
        console.log(event);
    };

 // 断线  
    webSocket.onclose = function () {
		
        console.log("websocket断开连接");
    };
}


</script>

</body>
</html>