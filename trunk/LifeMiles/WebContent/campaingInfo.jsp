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
	    
	     <style>
			.cerrar {
				  float: right;
				  font-size: 42px;
				  font-weight: bold;
				  line-height: 1;
				  color: #1464F5;
				  text-shadow: 0 1px 0 #fff;
				  filter: alpha(opacity=20);
				  opacity: 1;
				}
		</style>
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
			<div class="col-sm-12">
				<h5><span align="left" class="cabeceraBBVA"> Confirmaci�n </span></h5>
			</div>
			<div class="col-sm-12">
			<span class="titulo1">�Estamos obsesionados con que viajes!</span>
			</div>
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
				<div class="col-sm-2" align="center" >
					<img src="<%=request.getContextPath() %>ST/img/check_vf.png" class="img-responsive" alt="Responsive image" width="150px">
				</div>
					<!-- C�digo 101 --> 
					<c:if test="${clienteBase.TIP_CLIENTE == '101'}">
						
						<div class="col-sm-10" style="padding-top: 30px;" align="left">
							<span class="msjCuerpoVerdanaBold">�Felicitaciones  <c:out value="${fn:toUpperCase(clienteBase.NOMBRES)}" />!</span><br><br>
							<span class="msjCuerpoVerdana">Tenemos una Tarjeta de Cr�dito BBVA Continental LifeMiles pre-aprobada para ti. </span><br/><br/>
							<span class="msjCuerpoVerdana">En m�ximo 48 horas �tiles nos contactaremos contigo para continuar con el proceso. </span><br/><br/>
							<span class="msjCuerpoVerdana">Para conocer los T�rminos y Condiciones ingresa <label id="lblTerminos"><ins> aqu�</ins></label>.</span><br/>
						</div>
					 </c:if>
					
					<!-- C�digo 102 -->
					<c:if test="${clienteBase.TIP_CLIENTE == '102'}">
						<div class="col-sm-10" style="padding-top: 30px;" align="left">
							<span class="msjCuerpoVerdanaBold">�<c:out value="${fn:toUpperCase(clienteBase.NOMBRES)}" /> hemos recibido tu solicitud!</span><br><br>
							<span class="msjCuerpoVerdana">En m�ximo 48 horas �tiles nos contactaremos contigo para indicarte la informaci�n y/o documentos necesarios para continuar con tu solicitud. </span><br/><br/>
							<span class="msjCuerpoVerdana">Para hacer el proceso m�s r�pido no olvides tener a la mano los siguientes documentos: </span><br/><br/>
							<span class="msjCuerpoVerdana"> - 03 �ltimas boletas de pago o pago de impuestos por honorarios</span><br/>
							<span class="msjCuerpoVerdana"> - Documento de Identidad</span><br/>
							<span class="msjCuerpoVerdana"> - Recibo de luz, agua o tel�fono</span><br/>
							<span class="msjCuerpoVerdana"> - Copia de declaraci�n jurada (solo para independientes)</span><br/><br/>
		 
							<span class="msjCuerpoVerdana">Para conocer los T�rminos y Condiciones ingresa <label id="lblTerminos"><ins style="cursor: pointer"> aqu�</ins></label>.</span><br/>
						</div>
					</c:if>			
									
					<!-- C�digo 201, 202, 203, 204 -->
					<c:if test="${clienteBase.TIP_CLIENTE == '201' or clienteBase.TIP_CLIENTE == '202' or clienteBase.TIP_CLIENTE == '203' or clienteBase.TIP_CLIENTE == '204'}">
						<div class="col-sm-10" style="padding-top: 30px;" align="left">
							<span class="msjCuerpoVerdanaBold">Hola <c:out value="${fn:toUpperCase(clienteBase.NOMBRES)}" />,</span><br/><br/>
							<span class="msjCuerpoVerdanaBold">�Sabemos que ya tienes una Tarjeta de Cr�dito con nosotros!</span><br/><br/>
							<span class="msjCuerpoVerdana">En m�ximo 48 horas �tiles nos contactaremos contigo para comentarte sobre los beneficios  de la Tarjeta de Cr�dito BBVA Continental LifeMiles y continuar con el proceso de migraci�n.</span><br/><br/>
							<span class="msjCuerpoVerdana">Si lo prefieres, puedes realizarlo <b>ahora mismo</b> llamando al  595-0000 � acerc�ndote a la Oficina m�s cercana.</span><br/><br/>
							<span class="msjCuerpoVerdana">�Descubre las novedades que tenemos para ti!</span><br/><br/>
							<span class="msjCuerpoVerdana">Para conocer los T�rminos y Condiciones ingresa <label id="lblTerminos"><ins  style="cursor: pointer"> aqu�</ins></label>.</span><br/>
						</div>
					</c:if>
					
					<!-- C�digo 205, 206 -->
					<c:if test="${clienteBase.TIP_CLIENTE == '205' or clienteBase.TIP_CLIENTE == '206'}">
						<div class="col-sm-10" style="padding-top: 30px;" align="left">
							<span class="msjCuerpoVerdanaBold">Hola <c:out value="${fn:toUpperCase(clienteBase.NOMBRES)}" />,</span><br/><br/>
							<span class="msjCuerpoVerdanaBold">�Sabemos que ya tienes una Tarjeta de Cr�dito con nosotros!</span><br/><br/>
							<span class="msjCuerpoVerdana">Si quieres cambiarla y acceder a una tarjeta BBVA Continental LifeMiles, te invitamos a acercarte a cualquiera de nuestras Oficinas. </span><br/><br/>
							<span class="msjCuerpoVerdana">�Descubre los beneficios que tenemos para ti!</span><br/><br/>
							<span class="msjCuerpoVerdana">Para conocer los T�rminos y Condiciones ingresa <label id="lblTerminos"><ins  style="cursor: pointer"> aqu�</ins></label>.</span><br/>
						</div>
					</c:if>
					
					<!-- C�digo 207 -->
					<c:if test="${clienteBase.TIP_CLIENTE == '207'}">
						<div class="col-sm-10" style="padding-top: 30px;" align="left">
							<span class="msjCuerpoVerdanaBold">Hola <c:out value="${fn:toUpperCase(clienteBase.NOMBRES)}" />,</span><br/><br/>
							<span class="msjCuerpoVerdana">Al ser colaborador del BBVA Continental, tenemos un proceso especial para ti. </span><br/><br/>
							<span class="msjCuerpoVerdana">�S�lo ingresa a <a href="https://sites.google.com/a/bbva.com/portal-migracion-lifemiles-colaboradores/">https://sites.google.com/a/bbva.com/portal-migracion-lifemiles-colaboradores/</a> y  descubre los beneficios de la Tarjeta de Cr�dito BBVA Continental LifeMiles!</span><br/><br/>
						</div>
					</c:if>
				</div>
			</div>
			
			</form>
			<div class="row">
				<div id="espacio1" class="col-sm-12">
					<label for="espacio1" class="prompt"></label>
				</div>
			</div>
			<div class="row">
				<div id="espacio2" class="col-sm-12">
					<label for="espacio2" class="prompt"></label>
				</div>
			</div>
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
		
		
		<div class="modal fade" id="modalMostrarTerminos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
    	<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close cerrar" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel"
				style="color: #004c93;font: 12px/1.6em 'Stag Sans Medium',Arial,sans-serif bold;">T&Eacute;RMINOS Y CONDICIONES</h4>
			</div>
			<div class="modal-body"
			style="color: #67666a;font: 11px/1.3em 'Stag Sans Light',Arial,sans-serif;">
			&#8226; <ins><b>Para Tarjeta Nueva:</b></ins> El otorgamiento de la Tarjeta de Cr�dito est� sujeta a evaluaci�n por parte del Banco y a la suscripci�n de los documentos requeridos por �ste. La oferta  aprobada se mantendr� s�lo en caso el cliente mantenga las condiciones crediticias que motivaron su pre-aprobaci�n. La clasificaci�n del cliente deber� ser 100% normal en BBVA Continental y en el sistema financiero. No aplica en caso haber contratado un cr�dito con el BBVA Continental u otra entidad financiera en los �ltimos 45 d�as h�biles.<br></br>  Para acceder al bono de bienvenida el cliente debe cumplir con la meta de compras en terminales POS o por internet los primeros 30 d�as desde la emisi�n de la tarjeta.  Las metas son: Oro=S/. 800, Platinum=S/. 1,500, Signature=S/. 4,500. El bono s�lo se entrega por �nica vez al Titular de la tarjeta. Las tarjetas adicionales, migraci�n de tarjetas y upgrade no aplican al bono.<br/><br/>
			&#8226; <ins><b>Para Migraci�n a Tarjeta LifeMiles:</b></ins> Aplican clientes con tarjetas activas, de marca VISA en nuevos soles, con calificaci�n normal en el sistema financiero, sin deuda vencida, sin bloqueo temporal o definitivo y debe cumplir con la l�nea m�nima requerida para la nueva Tarjeta de Cr�dito: Visa Oro LifeMiles S/2,000, Visa Platinum LifeMiles S/.5,000 y Visa Signature LifeMiles S/.12,000.  Es necesaria la aceptaci�n de las nuevas condiciones de la Tarjeta LifeMiles indicadas en el nuevo HRI. Los clientes que deseen migrar a esta nueva tarjeta LifeMiles podr�n migrar la totalidad de sus Puntos Vida acumulados con todas sus tarjetas de cr�dito y d�bito BBVA a millas LifeMiles y recibir�n 1 milla por cada 1.5 Puntos Vida; adem�s de una bonificaci�n del 25% adicional de sus millas migradas. Esta bonificaci�n de millas ser� v�lida hasta el 30/04/15 y solo al momento que el cliente acepte la migraci�n de tarjeta. No se realizar� el abono de millas a las tarjetas que se encuentren bloqueadas por mora o sobregiro al momento de la acreditaci�n de las millas. En caso el cliente desee mantener sus Puntos Vida, deber� tener una Tarjeta de Cr�dito distinta a la LifeMiles o una tarjeta de d�bito del banco para poder realizar canjes. La nueva Tarjeta de Cr�dito llegar� a la direcci�n del contrato que est� registrada en la base de datos del banco.<br/><br/>
			&#8226; <ins><b>En caso de tarjetas nuevas o de migraci�n de tarjetas a Lifemiles:</b></ins> : El Cliente debe aceptar los t�rminos y condiciones del Programa y la Pol�tica de Privacidad de LifeMiles ingresando a www.lifemiles.com, de lo contrario podr�a no tener la posibilidad de redimir sus millas y/o no recibir informaci�n del Programa LifeMiles. Los temas relacionados con el servicio de transporte de Avianca, as� como la operatividad del programa LifeMiles, son de responsabilidad de Avianca. LifeMiles es una marca registrada de LifeMiles Corp. <br></br> En caso de incumplimiento de pago se aplicar�n, cobros de penalidad y dem�s pactados en su contrato y en caso corresponda se realizar� el reporte a las centrales de Riesgo. Mayor informaci�n sobre la tarjeta, tasa de inter�s, comisiones, gastos y penalidades se encuentran publicados en el tarifario en oficinas de atenci�n al p�blico y en bbvacontinental.pe. ITF 0.005% sujeto a variaci�n.<br/>
			</div>
    	</div>
  		</div>
	</div>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%= request.getContextPath()%>ST/bootstrap/js/jquery-1.11.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%= request.getContextPath()%>ST/bootstrap/js/bootstrap.min.js"></script>
    
    <script>
	    $(function(){
	    	$('#lblTerminos').bind('click', function(){
	    		fxMostrarTerminos();
	    		//fxActivaContinuar();
	    	});
	    	
	    });
	    
	    function fxMostrarTerminos() {
	    	$('#modalMostrarTerminos').modal({keyboard: false,backdrop: 'static'});
	    	$('#modalMostrarTerminos').modal('show');
	    	$("#modalMostrarTerminos").css("z-index", "1500");
	    }
    </script>
    	
    </body>
</html>
