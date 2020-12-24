<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        
        <title>AJAX</title>
    </head>
    <body style="background:url(photo1.jpg);background-size: cover;background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top: 10px;"class="center-align">Register </h3>
                            
                            <div class="form center-align">
                            	<h5 id="msg"class="center-align"></h5>
                                <form action="register.jsp" method="POST" id="myform">
                                <input type="text" placeholder="Enter your Name" name="name"/>
                                <input type="password" placeholder="Enter your password" name="pass" />
                                
                                
                               
                                <button type="submit" class="btn  red">Register</button>
                                 </div>
                                </form>
                            </div>
                            <div class="loader center-align" style="margin-top: 10px; display:none;">
                            	<h5> Registering... </h5>
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                
                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                
                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                
                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Please Wait....</h5>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
           

        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script>
                $(document).ready(function(){
                    console.log("Page is ready");

                    $("#myform").on('submit',function(event){
                           event.preventDefault();
                           var f=$(this).serialize();
                        
                           console.log(f);
                           $(".loader").show();
                           $(".form").hide();

                           $.ajax({
                               url: "register.jsp" ,
                               data:f,
                               type:'POST',
                               success: function(data,textStatus,jqXHR){
                                 console.log(data);
                                 console.log("succes");
                                 $(".loader").hide();
                                   $(".form").show();
                                   if(data.trim()==="success"){
                                       $("#msg").html("Succesfully Registered!!!");
                                       $("#msg").addClass("green-text");
                                   }
                                   else{
                                       $("#msg").html("Registering Failed !!!");
                                       $("#msg").addClass("red-text");
                                   }

                               },
                               error: function(jqXHR,textStatus,errorThrown){
                                  // console.log(data);
                                   console.log("error.....");
                                   $(".loader").hide();
                                   $(".form").show();
                                   $("#msg").html("Registering Failed !!!");
                                   $("#msg").addClass("red-text");

                               }
                              

                

                           })
                    })


                })
            </script>
    </body>
</html>
