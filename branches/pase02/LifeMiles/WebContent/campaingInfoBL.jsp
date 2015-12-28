<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean"  prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html class="no-js">
    <head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title></title>
	
	    <!-- Bootstrap -->
	    <link href="<%= request.getContextPath()%>ST/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="<%= request.getContextPath()%>ST/bootstrap/css/style.css" rel="stylesheet">
	    
		<link rel="stylesheet" href="<%=request.getContextPath()%>ST/css/jquery.range.css">
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
    </head>
    <body>

	<img id="rainbow" src="<%=request.getContextPath() %>ST/img/rainbow.png"/>

	<div class="container">
	<div class="row">
		<div class="col-sm-12">
		<img id="logo" src="<%=request.getContextPath() %>ST/img/logoSmall2.png" class="img-responsive" alt="Responsive image"/>
		</div>
		<div class="col-sm-12"><h5>
		<span align="left" class="cabeceraBBVA">
		Gracias por tu interés
		</span>
		</h5></div>
		<form name="frmLifeMilesInfo">
		<div class="col-sm-12">
		<div class="row">
		<div class="col-sm-5" style="padding-top: 30px;">
			<span class="msjCuerpoVerdanaBold">Hola <c:out value="${fn:toUpperCase(clienteBase.NOMBRES)}" />,</span><br><br>
			<span class="msjCuerpoVerdana">Agradecemos tu interés, pero en estos momentos no contamos con una tarjeta 
			disponible para ti. Esperamos atenderte en una próxima oportunidad.</span>
		</div>
		<div class="col-sm-3">
		<img src="<%=request.getContextPath() %>ST/img/tarjeta_oro_lfm2.png" class="img-responsive" alt="Responsive image">
		</div>
		</div>
		</div>
		</form>
		<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-5 col-sm-offset-3">
				<img  name="imgTerminar" src="<%=request.getContextPath() %>ST/img/finalizar_vf.png" onclick="window.location = 'https://www.bbvacontinental.pe/personas/';" />
           		<input type="submit" name="btnSolicitarTarjeta" value="Finalizar" style="display: none;"/>
			</div>
		</div>
		</div>
	</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%= request.getContextPath()%>ST/bootstrap/js/jquery-1.11.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%= request.getContextPath()%>ST/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='<%= request.getContextPath()%>/dwr/interface/CampaingAction.js'></script>
	<script type="text/javascript" src='<%= request.getContextPath()%>/dwr/interface/ParametroService.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath()%>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath()%>/dwr/util.js'></script>
	
	<script type="text/javascript" src="https://rawgit.com/BobKnothe/autoNumeric/master/autoNumeric.js"></script>
		
	<script type='text/javascript' src="<%=request.getContextPath()%>ST/js/jquery.range.js"></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>ST/js/header.js"></script>
	
	<script type='text/javascript' src="<%=request.getContextPath()%>ST/js/footer.js"></script>
	<script>
        function fxSolicitarTarjeta(){        	
        	alert("Antes del submit");
        	CampaingAction.consultarAjax(function(data){
        		alert(data);
        	});
        }
        
    </script>
    </body>
</html>
