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
		
		<!-- Google Tag Manager -->
	    <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-N9W8TX"
	    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	    '//www.googletagmanager.com/gtm.js?id='+i+dl+'&nc='+new Date().getTime();f.parentNode.insertBefore(j,f);
	    })(window,document,'script','dataLayer','GTM-N9W8TX');</script>
	    <!-- End Google Tag Manager -->
	    
	    <script>
            var dataLayer = dataLayer || [];
            dataLayer.push({
                'event': 'atm.formSubmit',
                'tipo': '${clienteBase.TIP_DOCUMENTO}',
                'estado_cod': '${clienteBase.TIP_CLIENTE}',
                'estado_txt': '',
                'transaction_id': '${clienteBase.CORRELATIVO}',
                'cliente_dni': '${clienteBase.NUM_DOCUMENTO}',
                'cliente_nombre': '${clienteBase.NOMBRES}',
                'cliente_apellido_paterno': '${clienteBase.APE_PATERNO}',
                'cliente_departamento': '${clienteBase.DEPARTAMENTO}',
                'cliente_provincia': '${clienteBase.PROVINCIA}'
            });
        </script>
		
	<img id="rainbow" src="<%=request.getContextPath() %>ST/img/rainbow.png"/>

	<div class="container">
	<div class="row">
		<div class="col-sm-12">
		<img id="logo" src="<%=request.getContextPath() %>ST/img/logoSmall3.png" class="img-responsive" alt="Responsive image"/>
		</div>
		<div class="col-sm-12"><h5>
		<span align="left" class="cabeceraBBVA">
		Gracias por tu interés
		</span>
		</h5></div>
		<form name="frmLifeMilesInfo">
		<div class="col-sm-12">
		<div class="row">
			<!-- Espacio -->
			<div class="col-sm-12" align="center">&nbsp;</div>
			<div class="col-sm-12" align="center">
				<img src="<%=request.getContextPath() %>ST/img/tarjeta_lifemile.png" class="img-responsive" alt="Responsive image">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" style="padding-top: 30px;">
				<span class="msjCuerpoVerdanaBold">Hola <c:out value="${fn:toUpperCase(clienteBase.NOMBRES)}" />,</span><br><br>
				<span class="msjCuerpoVerdana">Agradecemos tu interés, pero en estos momentos no contamos con una Tarjeta de Crédito BBVA Continental LifeMiles disponible para ti. Esperamos atenderte en una próxima oportunidad.  </span><br/><br/>
			</div>
		</div>
		</div>
		</form>
		<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-5 col-sm-offset-3">
				<!-- 
				<img  name="imgTerminar" src="<%=request.getContextPath() %>ST/img/finalizar_vf.png" onclick="window.location = 'https://www.bbvacontinental.pe/personas/';" />
           		<input type="submit" name="btnSolicitarTarjeta" value="Finalizar" style="display: none;"/>
           		 -->
           		
           		<input type="button" class="btn_habilitado" onclick="window.location = 'https://www.bbvacontinental.pe/personas/';" name="btnSolicitarTarjeta" value="FINALIZAR"/>
           		 
			</div>
		</div>
		</div>
	</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%= request.getContextPath()%>ST/bootstrap/js/jquery-1.11.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%= request.getContextPath()%>ST/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
