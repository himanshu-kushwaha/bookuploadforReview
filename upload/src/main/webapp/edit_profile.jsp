<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Edit Profile</title>

	
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="js/vendor/edit_profile.js"></script>			
  <!-- <link rel="stylesheet" href="css/style.css"> -->
  <style>
    #leftPanel{
    background-color:#0079ac;
    color:#fff;
    text-align: center;
}

#rightPanel{
    min-height:415px;
}

/* Credit to bootsnipp.com for the css for the color graph */
.colorgraph {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}
      </style>
</head>

<body>

<c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="GET" action="${contextPath}/edit/${pageContext.request.userPrincipal.name}">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">EDIT</a></h2>
    </c:if>
    
    <c:forEach items="${userForms}" var="userForm">     
	   <c:out value="${userForm.firstName}"/>
	   <c:out value="${userForm.address}"/>
	</c:forEach>


  <!-- <div class="container">
    <br>
    <br>
    <div class="row" id="main">
      <div class="col-md-4 well" id="leftPanel">
        <div class="row">
          <div class="col-md-12">
            <div>
              <img src="http://lorempixel.com/200/200/abstract/1/" alt="Texto Alternativo" class="img-circle img-thumbnail">
              <h2 id="username-display">User Name</h2>
        				<p id="user-address">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        				tempor incididunt ut labore et dolore magna aliqua.</p>
              <div class="btn-group">
                <button type="button" class="btn btn-warning">
                  Social</button>
                <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                  <span class="caret"></span><span class="sr-only">Social</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="https://twitter.com/dee_code_">Twitter</a></li>
                  <li><a href="https://plus.google.com/+Jquery2dotnet/posts">Google +</a></li>
                  <li><a href="https://www.facebook.com/02deepak11">Facebook</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Github</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-8 well" id="rightPanel">
        <div class="row">
          <div class="col-md-12">
            <form role="form">
              <h2>Edit your profile.<small>It's always easy</small></h2>
              <hr class="colorgraph">
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <div class="form-group">
                    <input type="text" name="firstName" id="firstName" class="form-control input-lg" placeholder="First Name"
                      tabindex="1">
                  </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <div class="form-group">
                    <input type="text" name="lastName" id="lastName" class="form-control input-lg" placeholder="Last Name"
                      tabindex="2">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <input type="email" name="userName" id="userName" class="form-control input-lg" placeholder="Email Address"
                  tabindex="4">
              </div>
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password"
                      tabindex="5">
                  </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <div class="form-group">
                    <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg"
                      placeholder="Confirm Password" tabindex="6">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <input type="text" name="address" id="address" class="form-control input-lg" placeholder="Address"
                  tabindex="4">
              </div>
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <div class="form-group">
                    <input type="number" name="pinCode" id="pinCode" class="form-control input-lg" placeholder="Pincode"
                      tabindex="5">
                  </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <div class="form-group">
                    <input type="text" name="mobileNumber" id="mobileNumber" class="form-control input-lg" placeholder="Mobile"
                      tabindex="5">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <select name="userType" class="form-control" id="sel1">
                  <option value="Individual">Individual</option>
                  <option value="Library">Library</option>
                  <option value="NGO">NGO</option>
                  <option value="stationary">stationary</option>
                </select>
              </div>
              <hr class="colorgraph">
              <div class="row">
                <div class="col-xs-12 col-md-6"></div>
                <div class="col-xs-12 col-md-6"><a href="#" id="save-button" class="btn btn-success btn-block btn-lg">Save</a></div>
              </div>
            </form>
          </div>
        </div>
        Modal
        <div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
              </div>
              <div class="modal-body">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum
                  at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro
                  delectus quidem dolorem ad.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum
                  at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro
                  delectus quidem dolorem ad.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum
                  at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro
                  delectus quidem dolorem ad.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum
                  at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro
                  delectus quidem dolorem ad.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum
                  at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro
                  delectus quidem dolorem ad.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum
                  at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro
                  delectus quidem dolorem ad.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum
                  at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro
                  delectus quidem dolorem ad.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
              </div>
            </div>/.modal-content
          </div>/.modal-dialog
        </div>/.modal
      </div>
    </div>
  </div>
  </div>


 -->
</body>

</html>