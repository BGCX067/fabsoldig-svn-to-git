function encabezado(){
	this.descripcion = "";
	this.colspan = "";
}

function showLoading(){
	var div1 = window.top.document.getElementById('loading-mask');
	var div2 = window.top.document.getElementById('loading');
	try {
		div1.style.display = "";
		div2.style.display = "";
	}catch(exception) {}
}

function closeLoading(){
	var div1 = window.top.document.getElementById('loading-mask');
	var div2 = window.top.document.getElementById('loading');
	try {
		div1.style.display = "none";
		div2.style.display = "none";
	}catch(exception) {}
}

function scrollTopForm(){
	if (window.parent.innerHeight) {
		//Firefox
		window.parent.scrollBy(0,-(window.parent.innerHeight*5));
	}
	else {
		//IExplorer
		window.parent.scrollBy(0,-(document.body.clientHeight*5));
	}
}


function deleteTblRowAdded(idTableForm){
	
	var tabla = document.getElementById(idTableForm);
  	var tablaBody = tabla.getElementsByTagName("tbody")[0];
  	var filas = tablaBody.getElementsByTagName("tr");

  	for(var i=0; i<filas.length; i++){
  		if(filas[i].id == 'undefined'){
  			jQuery("#"+idTableForm).jqGrid('delRowData',filas[i].id);
  			break;
  		}
  	}
}

function flushTblRowAdded(idTableForm, nameFieldCode, indexTDCode, indexTDAdded, idGenerado){
	
	var tabla = document.getElementById(idTableForm);
  	var tablaBody = tabla.getElementsByTagName("tbody")[0];
  	var filas = tablaBody.getElementsByTagName("tr");
	var contador = 1;

  	for(var i=0; i<filas.length; i++){
  		if(filas[i].id == 'undefined'){
  			
  			if(i > 0){
  				contador = parseFloat(filas[i-1].id);	
  			}
  			
  			if(isNaN(contador)){
  				filas[i].id	= 1;
  			}else{
  				filas[i].id = contador+1;
  			}
  			
  			var celdaValue = filas[i].getElementsByTagName("td")[indexTDAdded].title;
  			document.getElementById("jqg_"+idTableForm+"_undefined").id = "jqg_"+idTableForm+"_"+filas[i].id;
  			
  			if(celdaValue == '-1'){
  				if(indexTDCode == 0){
  	  				filas[i].getElementsByTagName("td")[indexTDAdded].title = idGenerado;
  	  				
	  	  			if(nameFieldCode != ''){
	  					filas[i].getElementsByTagName("td")[indexTDAdded].innerHTML = idGenerado+
	  	  				"<input type='hidden' name='"+nameFieldCode+"' value='"+idGenerado+"' />";
	  				}else{
	  					filas[i].getElementsByTagName("td")[indexTDAdded].innerHTML = idGenerado;
	  				}
  				}else{
  					var titleText = filas[i].getElementsByTagName("td")[indexTDCode].title;
  	  				filas[i].getElementsByTagName("td")[indexTDAdded].title = titleText;
  	  				
	  	  			if(nameFieldCode != ''){
	  					filas[i].getElementsByTagName("td")[indexTDAdded].innerHTML = titleText+
	  	  				"<input type='hidden' name='"+nameFieldCode+"' value='"+titleText+"' />";
	  				}else{
	  					filas[i].getElementsByTagName("td")[indexTDAdded].innerHTML = titleText;
	  				}
  				}  				  				
  			}
  			
  			break;
  		}
  	}
}

function flushTblRowEdited(idTableForm, nameFieldCode, indexTDCode, indexTDEdited, indexRowEdited){
	
	var tabla = document.getElementById(idTableForm);
  	var tablaBody = tabla.getElementsByTagName("tbody")[0];
  	var filas = tablaBody.getElementsByTagName("tr");
  	var nIndexRow = parseFloat(indexRowEdited);
  	
  	if(parseFloat(indexRowEdited) >= 0){
  	
		var celdaValue = filas[nIndexRow].getElementsByTagName("td")[indexTDEdited].title;
		var titleText  = filas[nIndexRow].getElementsByTagName("td")[indexTDCode].title;
		if(celdaValue != titleText){
			
			filas[nIndexRow].getElementsByTagName("td")[indexTDEdited].title = titleText;
			if(nameFieldCode != ''){
				filas[nIndexRow].getElementsByTagName("td")[indexTDEdited].innerHTML = titleText+
				"<input type='hidden' name='"+nameFieldCode+"' value='"+titleText+"' />";
			}else{
				filas[nIndexRow].getElementsByTagName("td")[indexTDEdited].innerHTML = titleText;
			}
		}
	}
}

function validationTasaSubProduct(e) {
	
	var obj = document.getElementsByName("valTasa")[0];
	var tecla = (document.all) ? e.keyCode : e.which; 
    if (tecla == 13 || tecla == 9) { // se pulso enter o tab
	
		try{
			var x = parseFloat(obj.value); 
			if (isNaN(x) || x < 0 || x > 100) { 
				obj.value = '';
			}else{
				
				var RegExPattern = /^\d{1,3}(\.\d{1,3})?$/;
			    if(obj.value.match(RegExPattern) == null){
			    	alert('Debe ingresar como maximo 3 numeros enteros con 3 decimales.');
			    	e.cancelBubble = true;
			    	
			    	try{
					e.stopPropagation();
			    	}catch(excepie){}
			    	
			    	obj.value = '';
			    	return false;
			    };
			};
		}catch(exception){
			obj.value = '';
		}
    }
    
    return true;
}

function validarNumDecimal(obj) {
	
	try{
		var x = parseFloat(obj.value); 
		if (isNaN(x)) { 
			obj.value = '';
		}else{
			
			var RegExPattern = /^\d{1,7}(\.\d{1,2})?$/;
		    if(obj.value.match(RegExPattern) == null){
		    	alert('Debe ingresar como maximo 7 numeros enteros con 2 decimales.');
		    	obj.value = '';
		    }
		}
	}catch(exception){
		obj.value = '';
	}
}

function validationMaxRangoSubProduct(e){
	
	var obj = document.getElementsByName("rangoMax")[0];
	var tecla = (document.all) ? e.keyCode : e.which; 
    if (tecla == 13 || tecla == 9) { // se pulso enter o tab
    	
    	try{
    		var x = parseFloat(obj.value); 
    		if (isNaN(x)) { 
    			obj.value = '';
    		}else{
    			
    			var RegExPattern = /^\d{1,7}(\.\d{1,2})?$/;
    		    if(obj.value.match(RegExPattern) == null){
    		    	alert('Debe ingresar como maximo 7 numeros enteros con 2 decimales.');
    		    	e.cancelBubble = true;
    		    	
    		    	try{
					e.stopPropagation();
			    	}catch(excepie){}

    		    	obj.value = '';
    		    	return false;
    		    }else{
    		    	
    		    	var rangoMin = document.getElementsByName('rangoMin')[0];
    				var rangoMax = document.getElementsByName('rangoMax')[0];
    				
    				if(rangoMin != undefined && rangoMax != undefined){
    					
    					var y = parseFloat(rangoMin.value); 
    					if (isNaN(y)) { 
    						rangoMin.value = '';
    					}
    					
    					var z = parseFloat(rangoMax.value); 
    					if (isNaN(z)) { 
    						rangoMax.value = '';
    					}
    					
    					if(rangoMin.value != '' && rangoMax.value != ''){
    						if(parseFloat(rangoMax.value) <= parseFloat(rangoMin.value)){
    							alert('El valor maximo del rango no debe ser menor que el valor minimo.');
    							e.cancelBubble = true;

    							try{
								e.stopPropagation();
						    	}catch(excepie){}

    							return false;
    						}
    					}else if(rangoMin.value == '' && rangoMax.value != ''){
    						rangoMin.value = '0';
    					}
    		    	}
    		    }
    		}
    	}catch(exception){
    		obj.value = '';
    	}
    }
    
    return true;
}

function validationDataSubProduct(e){
	
	var isOk = true;
	var tecla = (document.all) ? e.keyCode : e.which; 
    if (tecla == 13 || tecla == 9) { // se pulso enter o tab
    	
    	if(isOk){
    		isOk = validationTasaSubProduct(e);
    	}
    	
    	if(isOk){
    		isOk = validationMinRangoSubProduct(e);
    	}
    	
    	if(isOk){
    		isOk = validationMaxRangoSubProduct(e);
    	}
    }	
}

function validationCodSubProduct(e){
	
	var isOk = true;
	var tecla = (document.all) ? e.keyCode : e.which; 
    if (tecla == 13 || tecla == 9) { // se pulso enter o tab
    	
    	var codSubProducto = document.getElementsByName("codSubProducto")[0];
    	if(codSubProducto != undefined){
    		codSubProducto.value = codSubProducto.value.toUpperCase();
    	}
    	
    	if(isOk){
    		isOk = validationTasaSubProduct(e);
    	}
    	
    	if(isOk){
    		isOk = validationMinRangoSubProduct(e);
    	}
    	
    	if(isOk){
    		isOk = validationMaxRangoSubProduct(e);
    	}
    }
}

function validationMinRangoSubProduct(e){
	
	var obj = document.getElementsByName("rangoMin")[0];
	var tecla = (document.all) ? e.keyCode : e.which; 
    if (tecla == 13 || tecla == 9) { // se pulso enter o tab
    	
    	try{
    		var x = parseFloat(obj.value); 
    		if (isNaN(x)) { 
    			
				var rangoMax = document.getElementsByName('rangoMax')[0];
				if(obj.value == '' && rangoMax.value != ''){
					obj.value = '0';
				}else{
					obj.value = '';
				}    			
    			
    		}else{
    			
    			var RegExPattern = /^\d{1,7}(\.\d{1,2})?$/;
    		    if(obj.value.match(RegExPattern) == null){
    		    	alert('Debe ingresar como maximo 7 numeros enteros con 2 decimales.');
    		    	e.cancelBubble = true;

    		    	try{
					e.stopPropagation();
			    	}catch(excepie){}
    		    	
    		    	obj.value = '';
    		    	return false;
    		    }else{
    		    	
    		    	var rangoMin = document.getElementsByName('rangoMin')[0];
    				var rangoMax = document.getElementsByName('rangoMax')[0];
    				
    				if(rangoMin != undefined && rangoMax != undefined){
    					
    					var y = parseFloat(rangoMin.value); 
    					if (isNaN(y)) { 
    						rangoMin.value = '';
    					}
    					
    					var z = parseFloat(rangoMax.value); 
    					if (isNaN(z)) { 
    						rangoMax.value = '';
    					}
    					
    					if(rangoMin.value != '' && rangoMax.value != ''){
    						if(parseFloat(rangoMax.value) <= parseFloat(rangoMin.value)){
    							alert('El valor maximo del rango no debe ser menor que el valor minimo.');
    							e.cancelBubble = true;

    							try{
								e.stopPropagation();
						    	}catch(excepie){}
    							
    							return false;
    						}
    					}else if(rangoMin.value == '' && rangoMax.value != ''){
    						rangoMin.value = '0';
    					}
    		    	}
    		    }
    		}
    	}catch(exception){
    		obj.value = '';
    	}
    }
    
    return true;
}

function validarNumPorcent(obj) {
	
	try{
		var x = parseFloat(obj.value); 
		if (isNaN(x) || x < 0 || x > 100) { 
			obj.value = '';
			obj.focus();
		}else{
			
			var RegExPattern = /^\d{1,3}(\.\d{1,3})?$/;
		    if(obj.value.match(RegExPattern) == null){
		    	alert('Debe ingresar como maximo 3 numeros enteros con 3 decimales.');
		    	obj.value = '';
		    };
		};
	}catch(exception){
		obj.value = '';
	};
}

function validarNumPorcentInteger(obj) {
	
	try{
		var x = parseFloat(obj.value); 
		if (isNaN(x) || x < 0 || x > 100) { 
			obj.value = '0';
		}else{
			
			var RegExPattern = /^\d+$/;
		    if(obj.value.match(RegExPattern) == null){
		    	alert('Debe ingresar como maximo 3 numeros enteros.');
		    	obj.value = '0';
		    };
		};
	}catch(exception){
		obj.value = '0';
	};
}

function changeValueIsBlank(valString){
	if(valString == '' || valString == null){
		return '&nbsp';
	}
	return valString;
}

function manageChecked(objRadio) {
	objRadio.checked = false;
}

function getElementsByName_iefix(name, tag) {
    
	if(!tag){
        tag = '*';
    }
	
    var elem = document.getElementsByTagName(tag);
    var arr = [];
    for(var i = 0; i < elem.length; i++) {
         att = elem[i].getAttribute("name");
         if(att == name) {
        	 arr.push(elem[i]);
         }
    }
    return arr;
}

function setEventsValidationConfigProd(){
	
	jQuery("input[name=valTasa]").bind("keydown",function (evnt){
   		validationTasaSubProduct(evnt);
    });
    
    jQuery("input[name=valTipo]").bind("keydown",function (evnt){
   		validationDataSubProduct(evnt);
    });
    
    jQuery("input[name=valBin]").bind("keydown",function (evnt){
   		validationDataSubProduct(evnt);
    });
    
    jQuery("input[name=codSubProducto]").bind("keydown",function (evnt){
		validationCodSubProduct(evnt);
    });
    
    jQuery("input[name=desSubProducto]").bind("keydown",function (evnt){
   		validationDataSubProduct(evnt);
    });
    
    jQuery("select[name=divisa]").bind("keydown",function (evnt){
   		validationDataSubProduct(evnt);
    });
    
    jQuery("input[name=rangoMin]").bind("keydown",function (evnt){
   		validationMinRangoSubProduct(evnt);
    });
    
    jQuery("input[name=rangoMax]").bind("keydown",function (evnt){
   		validationMaxRangoSubProduct(evnt);
    });
}

function validarNumeros(e, obj) { 
    tecla = (document.all) ? e.keyCode : e.which; 
    if (tecla != 8){//Tecla de retroceso (para poder borrar)
    	patron = /\d/; //ver nota 
        te = String.fromCharCode(tecla); 
        var isValid = patron.test(te);
        if(!isValid){
        	obj.value = '';
        }	
    }      
}