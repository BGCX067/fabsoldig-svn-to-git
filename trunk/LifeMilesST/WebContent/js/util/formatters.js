function genericUnFormat(cellvalue, options, cell){
	return $('input', cell).attr('value');
}

function genericCheckUnFormat(cellvalue, options, cell){
	var checked = $('input', cell).attr('checked');
	if(checked){
		return "1";
	}else{
		return "0";
	}
}

////////////////////////////////////////////////////////
//ofertasDinamicas.js
////////////////////////////////////////////////////////

function valSeleccionFormat(cellvalue, options, rowObject){	
	var idInput = "arrayValSeleccion";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	var indicatorInitial = document.getElementById('indicatorInitial').value;
	if(indicatorInitial == ''){
		return "<input type='radio' id='"+idInput+"' ondblclick='manageChecked(this);' onclick='setTextEditable(\""+arrayID[1]+"\","+options.rowId+", "+rowObject.nivelaOferta+");' onmouseover='setTitleRadio(this, \""+arrayID[1]+"\","+options.rowId+");' name='arrayValSeleccion' value='"+idInput+"' />";
	}else{
		
		var arrayIndicator = indicatorInitial.split('|');
		if(arrayIndicator[0] == rowObject.codPlazo && arrayIndicator[1] == rowObject.codProducto && arrayIndicator[2] == rowObject.codConfigProducto && arrayIndicator[3] == rowObject.idSubProducto){
			
			tasaContrato = rowObject.valTasa;
			divisaContrato = rowObject.divisa;
			codPlazoContrato = rowObject.codPlazo;
			desPlazoContrato = rowObject.desPlazo;
			binSubProductoContrato = rowObject.valBin;
			contrataProdContrato = rowObject.contrata;
			cuotaContrato = rowObject.valCuotaContrato;
			codProductoContrato = rowObject.codProducto;
			desProductoContrato = rowObject.desProducto;
			importeContrato = rowObject.valLimiteContrato;
			desSubProductoContrato = rowObject.desSubProducto;
			familiaProductoContrato = rowObject.familiaProducto;			
			
			if(familiaProductoContrato == FAMILIA_TARJETAS){
				codSubProductoContrato = rowObject.valTipo;
			}else{
				codSubProductoContrato = rowObject.codSubProducto;
			}			
			
			return "<input checked='checked' type='radio' id='"+idInput+"' ondblclick='manageChecked(this);' onclick='setTextEditable(\""+arrayID[1]+"\","+options.rowId+", "+rowObject.nivelaOferta+");' onmouseover='setTitleRadio(this, \""+arrayID[1]+"\","+options.rowId+");' name='arrayValSeleccion' value='"+idInput+"' />";
		}else{
			return "<input type='radio' id='"+idInput+"' ondblclick='manageChecked(this);' onclick='setTextEditable(\""+arrayID[1]+"\","+options.rowId+", "+rowObject.nivelaOferta+");' onmouseover='setTitleRadio(this, \""+arrayID[1]+"\","+options.rowId+");' name='arrayValSeleccion' value='"+idInput+"' />";
		}
	}	
}

function valCuotaAjustFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayCuotaAjust";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}

	return "<input type='hidden' id='"+idInput+"' name='arrayCuotaAjust' value='"+cellvalue+"' />";
}

function valCuotaContratoFormat(cellvalue, options, rowObject) {
	var idInput = "arrayCuotaContrato";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	if(cellvalue == null || cellvalue == undefined || cellvalue == 'null'){
		return "&nbsp;<input type='hidden' id='"+idInput+"' name='arrayCuotaContrato' value='"+cellvalue+"' />";
	}else{
		if((''+cellvalue).indexOf('.') == -1){
			cellvalue = cellvalue+'.00';
		}
		valorCuotaTCEA = cellvalue+((rowObject.valLimiteContrato*(PORCENTAJE_SEGURO/100))+PORTES_COMISION);
		pintar = formatMoney(valorCuotaTCEA, 2, ",", ".", "");
		return pintar+"<input type='hidden' id='"+idInput+"' name='arrayCuotaContrato' value='"+cellvalue+"' />";	
	}
}

function valCuotaRealFormat(cellvalue, options, rowObject) {
	
	var idInput = "arrayCuotaReal";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return "<input type='hidden' id='"+idInput+"' name='arrayCuotaReal' value='"+cellvalue+"' />";
}

function valTasaFormat(cellvalue, options, rowObject) {
	
	var idInput = "arrayTasa";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	var indicatorInitial = document.getElementById('indicatorInitial').value;
	if(indicatorInitial == ''){
		return "<input type='text' id='"+idInput+"' readonly='readonly' name='arrayTasa' style='text-align: right;' size='5' maxlength='6' onkeydown='pressKeyProcess(\""+"tasa"+"\", \""+arrayID[1]+"\","+options.rowId+", event);' onblur='calculateByTasa(\""+arrayID[1]+"\","+options.rowId+", event);' value='"+cellvalue+"' />";
	}else{
//RDELOSREYES - Cambio GSI 26032013_019_Hermes Comportamental		
		//var arrayIndicator = indicatorInitial.split('|');		//Se descomento la linea para prueba con GVERAM 2013-09-04
		//if(arrayIndicator[0] == rowObject.codPlazo && arrayIndicator[1] == rowObject.codProducto && arrayIndicator[2] == rowObject.codConfigProducto && arrayIndicator[3] == rowObject.idSubProducto){	//Se descomento la linea para prueba con GVERAM 2013-09-04
			//return "<input type='text' id='"+idInput+"' name='arrayTasa' style='text-align: right;' size='5' maxlength='6' onkeydown='pressKeyProcess(\""+"tasa"+"\", \""+arrayID[1]+"\","+options.rowId+", event);' onblur='calculateByTasa(\""+arrayID[1]+"\","+options.rowId+", event);' value='"+cellvalue+"' />"; //Se descomento la linea para prueba con GVERAM 2013-09-04
		//}else{ //Se descomento la linea para prueba con GVERAM 2013-09-04
			return "<input type='text' id='"+idInput+"' readonly='readonly' name='arrayTasa' style='text-align: right;' size='5' maxlength='6' onkeydown='pressKeyProcess(\""+"tasa"+"\", \""+arrayID[1]+"\","+options.rowId+", event);' onblur='calculateByTasa(\""+arrayID[1]+"\","+options.rowId+", event);' value='"+cellvalue+"' />";
		//} //Se descomento la linea para prueba con GVERAM 2013-09-04
	}
}

function valTasaHdnFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayTasaHdn";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayTasaHdn' value='"+cellvalue+"' />";
}

function codPlazoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayCodPlazo";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayCodPlazo' value='"+cellvalue+"' />";
}

function desPlazoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayDesPlazo";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayDesPlazo' value='"+cellvalue+"' />";
}

function nivelaOfertaFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayNivelaOferta";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayNivelaOferta' value='"+cellvalue+"' />";
}

function contrataProdFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayContrataProd";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayContrataProd' value='"+cellvalue+"' />";
}

function codProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayCodProducto";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayCodProducto' value='"+cellvalue+"' />";
}

function familiaProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayFamiliaProducto";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayFamiliaProducto' value='"+cellvalue+"' />";
}

function tipoSubProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayTipoSubProducto";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayTipoSubProducto' value='"+cellvalue+"' />";
}

function binSubProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayBinSubProducto";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayBinSubProducto' value='"+cellvalue+"' />";
}

function codConfigProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayCodConfigProd";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayCodConfigProd' value='"+cellvalue+"' />";
}

function codSubProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayCodSubProducto";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' readonly='readonly' name='arrayCodSubProducto' value='"+cellvalue+"' />";
}

function idSubProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayIDSubProducto";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' readonly='readonly' name='arrayIDSubProducto' value='"+cellvalue+"' />";
}

function desProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayDesProducto";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayDesProducto' value='"+cellvalue+"' />";
}

function desConfigProductoFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayDesConfigProd";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayDesConfigProd' value='"+cellvalue+"' />";
}

function desSubProductoFormat(cellvalue, options, rowObject){
	var idInput = "arrayDesSubProducto";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return cellvalue+"<input type='hidden' id='"+idInput+"' readonly='readonly' name='arrayDesSubProducto' value='"+cellvalue+"' />";
}

function divisaFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayDivisa";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	if(cellvalue == null || cellvalue == undefined || cellvalue == 'null'){
		return "&nbsp;<input type='hidden' id='"+idInput+"' name='arrayDivisa' value='"+cellvalue+"' />";
	}else{
		return cellvalue+"<input type='hidden' id='"+idInput+"' name='arrayDivisa' value='"+cellvalue+"' />";
	}	
}


function rangoMaxFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayRangoMax";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return "<input type='hidden' id='"+idInput+"' name='arrayRangoMax' value='"+cellvalue+"' />";	
}

function rangoMinFormat(cellvalue, options, rowObject){
	
	var idInput = "arrayRangoMin";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	if(cellvalue == null || cellvalue == undefined || cellvalue == 'null'){
		return "&nbsp;<input type='hidden' id='"+idInput+"' name='arrayRangoMin' value='"+cellvalue+"' />";
	}else{
		if((''+cellvalue).indexOf('.') == -1){
			cellvalue = cellvalue+'.00';
		}
		pintar = formatMoney(cellvalue, 2, ",", ".", "");
		
		return pintar+"<input type='hidden' id='"+idInput+"' name='arrayRangoMin' value='"+cellvalue+"' />";	
	}
}

function valLimiteRealFormat(cellvalue, options, rowObject){
	
	if(cellvalue == null || cellvalue == undefined || cellvalue == 'null'){
		cellvalue = '0.00';
	}
	
	var idInput = "arrayLimiteReal";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return "<input type='text' id='"+idInput+"' name='arrayLimiteReal' readonly='readonly' style='text-align: right;' value='"+cellvalue+"' />";
}

function valLimiteAjustFormat(cellvalue, options, rowObject){
	
	if(cellvalue == null || cellvalue == undefined || cellvalue == 'null'){
		cellvalue = '0.00';
	}
	
	if((''+cellvalue).indexOf('.') == -1){
		cellvalue = cellvalue+'.00';
	}
	
	var idInput = "arrayLimiteAjust";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	return "<input type='text' id='"+idInput+"' name='arrayLimiteAjust' readonly='readonly' style='text-align: right;' value='"+cellvalue+"' />";
}

function valLimiteContratoFormat(cellvalue, options, rowObject){
	
	if(cellvalue == null || cellvalue == undefined || cellvalue == 'null'){
		cellvalue = '0.00';
	}
	
	if((''+cellvalue).indexOf('.') == -1){
		cellvalue = cellvalue+'.00';
	}
	
	var idInput = "arrayLimiteContrato";
	var arrayID = options.gid.split("listSubProducts");
	if(arrayID.length > 0){
		idInput += "-"+arrayID[1]+"-"+options.rowId;
	}
	
	var indicatorInitial = document.getElementById('indicatorInitial').value;
	if(indicatorInitial == ''){
		return "<input type='text' id='"+idInput+"' name='arrayLimiteContrato' readonly='readonly' onkeydown='pressKeyProcess(\""+"limite"+"\", \""+arrayID[1]+"\","+options.rowId+", event);' onblur='calculateByLimite(\""+arrayID[1]+"\","+options.rowId+", event)' style='text-align: right;' value='"+cellvalue+"' size='15' />";
	}else{
		
		var arrayIndicator = indicatorInitial.split('|');
		if(arrayIndicator[0] == rowObject.codPlazo && arrayIndicator[1] == rowObject.codProducto && arrayIndicator[2] == rowObject.codConfigProducto && arrayIndicator[3] == rowObject.idSubProducto){
			return "<input type='text' id='"+idInput+"' name='arrayLimiteContrato' onkeydown='pressKeyProcess(\""+"limite"+"\", \""+arrayID[1]+"\","+options.rowId+", event);' onblur='calculateByLimite(\""+arrayID[1]+"\","+options.rowId+", event)' style='text-align: right;' value='"+cellvalue+"' size='15' />";
		}else{
			return "<input type='text' id='"+idInput+"' name='arrayLimiteContrato' readonly='readonly' onkeydown='pressKeyProcess(\""+"limite"+"\", \""+arrayID[1]+"\","+options.rowId+", event);' onblur='calculateByLimite(\""+arrayID[1]+"\","+options.rowId+", event)' style='text-align: right;' value='"+cellvalue+"' size='15' />";
		}
	}
}

////////////////////////////////////////////////////////
//operacionesEnVuelo.jsp
////////////////////////////////////////////////////////

function btnAnularFormat(cellvalue, options, rowObject){
	
	if(rowObject.tipoScoring == 'P' && rowObject.tipoOperacion == 'V'){
		return "<a href='#' onclick='anularContrato(\""+rowObject.numeroContrato+"\", \""+rowObject.familiaProducto+"\", \""+rowObject.tipoProducto+"\");' class='buttonOHC'><font color='#FFFFFF'>ANULAR</font></a>";
		//return "<input type='button' name='btnAnular' value='Anular' onclick='anularContrato(\""+rowObject.numeroContrato+"\", \""+rowObject.familiaProducto+"\", \""+rowObject.tipoProducto+"\");' />";
	}else{
		return "&nbsp;";
	}	
}

function tipoScoringFormat(cellvalue, options, rowObject){
	if(cellvalue == 'R'){
		return "<span style='color: #FF0000'><b>Reactivo</b></span><input type='hidden' name='arrayTipoScoring' value='"+cellvalue+"' />";
	}else if(cellvalue == 'P'){
		return "<span style='color: #0000FF'><b>Proactivo</b></span><input type='hidden' name='arrayTipoScoring' value='"+cellvalue+"' />";
	}else{
		return "&nbsp;<input type='hidden' name='arrayTipoScoring' value='"+cellvalue+"' />";
	}
}

function tipoOperacionFormat(cellvalue, options, rowObject){
	
	if(cellvalue == 'V'){
		return "<span style='color: #007700'><b>En Vuelo</b></span><input type='hidden' name='arrayTipoOperacion' value='"+cellvalue+"' />";
	}else if(cellvalue == 'D'){
		return "<span style='color: #000000;'><b>Formalizada</b></span><input type='hidden' name='arrayTipoOperacion' value='"+cellvalue+"' />";
	}else if(cellvalue == 'R'){
		return "<span style='color: #FF0000'>Anulada</span><input type='hidden' name='arrayTipoOperacion' value='"+cellvalue+"' />";
	}else{
		return "&nbsp;<input type='hidden' name='arrayTipoOperacion' value='"+cellvalue+"' />";
	}	
}

////////////////////////////////////////////////////////
// administrador.jsp
////////////////////////////////////////////////////////

function codProdFormat(cellvalue, options, rowObject){
	return cellvalue+"<input type='hidden' name='arrayCodProd' value='"+cellvalue+"' />";
}

function nivelaFormat(cellvalue, options, rowObject){
	var checkbox = '';
	if(cellvalue == '1' || cellvalue == 'Yes'){
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arryNivela, idTableProduct);' name='arrayNivela' offval='no' value='"+cellvalue+"' checked='checked' />";
	}else{
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arryNivela, idTableProduct);' name='arrayNivela' offval='no' value='"+cellvalue+"' />";
	}
	
	return checkbox;
}

function multContFormat(cellvalue, options, rowObject){
	var checkbox = '';
	if(cellvalue == '1' || cellvalue == 'Yes'){
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arryMultCont, idTableProduct);' name='arrayMultCont' offval='no' value='"+cellvalue+"' checked='checked' />";
	}else{
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arryMultCont, idTableProduct);' name='arrayMultCont' offval='no' value='"+cellvalue+"' />";
	}
	
	return checkbox;
}

function simulaFormat(cellvalue, options, rowObject){
	var checkbox = '';
	if(cellvalue == '1' || cellvalue == 'Yes'){
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arrySimula, idTableProduct);' name='arraySimula' offval='no' value='"+cellvalue+"' checked='checked' />";
	}else{
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arrySimula, idTableProduct);' name='arraySimula' offval='no' value='"+cellvalue+"' />";
	}
	
	return checkbox;
}

function contrataFormat(cellvalue, options, rowObject){
	var checkbox = '';
	if(cellvalue == '1' || cellvalue == 'Yes'){
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arryContrata, idTableProduct);' name='arrayContrata' offval='no' value='"+cellvalue+"' checked='checked' />";
	}else{
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arryContrata, idTableProduct);' name='arrayContrata' offval='no' value='"+cellvalue+"' />";
	}
	
	return checkbox;
}

function checkSegmentoAdminFormat(cellvalue, options, rowObject){
	var checkbox = '';
	if(cellvalue == '1' || cellvalue == 'Yes'){
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arrSegmentos, idTableSegmento);' name='arrayCheckSegmento' offval='no' value='"+cellvalue+"' checked='checked' />";
	}else{
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arrSegmentos, idTableSegmento);' name='arrayCheckSegmento' offval='no' value='"+cellvalue+"' />";
	}
	
	return checkbox;
}

//ini MCG20140716

function codMensajeFormat(cellvalue, options, rowObject){
	return cellvalue+"<input type='hidden' name='arrayCodMensaje' value='"+cellvalue+"' />";
}

function checkMensajeFormat(cellvalue, options, rowObject){
	var checkbox = '';
	if(cellvalue == '1' || cellvalue == 'Yes'){
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arrMensaje, idTableMensaje);' name='arrayCheckMensaje' offval='no' value='"+cellvalue+"' checked='checked' />";
	}else{
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 1, arrMensaje, idTableMensaje);' name='arrayCheckMensaje' offval='no' value='"+cellvalue+"' />";
	}
	
	return checkbox;
}



//fin MCG20140716

////////////////////////////////////////////////////////
//configProductoForm.jsp
////////////////////////////////////////////////////////

function configDivisaFormat(cellvalue, options, rowObject){
	
	if(cellvalue == 'PEN'){
		return "Soles<input type='hidden' name='arrayDivisa' value='"+cellvalue+"' />";
	}else if(cellvalue == 'USD'){
		return "Dolares<input type='hidden' name='arrayDivisa' value='"+cellvalue+"' />";
	}else{		
		if(cellvalue == null || cellvalue == undefined || cellvalue == 'null'){
			return "&nbsp;<input type='hidden' name='arrayDivisa' value='"+cellvalue+"' />";
		}else{
			return cellvalue+"<input type='hidden' name='arrayDivisa' value='"+cellvalue+"' />";
		}		
	}
}

function codEmisoraFormat(cellvalue, options, rowObject){
	return cellvalue+"<input type='hidden' name='arrayCodEmisora' value='"+cellvalue+"' />";
}

function checkEmisoraFormat(cellvalue, options, rowObject){
	var checkbox = '';
	if(cellvalue == '1' || cellvalue == 'Yes'){
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 2, arrEmisoras, idTableEmisora);' name='arrayCheckEmisora' offval='no' value='"+cellvalue+"' checked='checked' />";
	}else{
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 2, arrEmisoras, idTableEmisora);' name='arrayCheckEmisora' offval='no' value='"+cellvalue+"' />";
	}
	
	return checkbox;
}

function codSegmentoFormat(cellvalue, options, rowObject){
	return cellvalue+"<input type='hidden' name='arrayCodSegmento' value='"+cellvalue+"' />";
}

function checkSegmentoFormat(cellvalue, options, rowObject){
	var checkbox = '';
	if(cellvalue == '1' || cellvalue == 'Yes'){
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 2, arrSegmentos, idTableSegmento);' name='arrayCheckSegmento' offval='no' value='"+cellvalue+"' checked='checked' />";
	}else{
		checkbox = "<input type='checkbox' onclick='selectCheckGrid(this, 2, arrSegmentos, idTableSegmento);' name='arrayCheckSegmento' offval='no' value='"+cellvalue+"' />";
	}
	
	return checkbox;
}

function formatMoney(numberToFormat, decPlaces, thouSeparator, decSeparator, currencySymbol) {
    // check the args and supply defaults:
    decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces;
    decSeparator = decSeparator == undefined ? "." : decSeparator;
    thouSeparator = thouSeparator == undefined ? "," : thouSeparator;
    currencySymbol = currencySymbol == undefined ? "S/." : currencySymbol;

    var n = numberToFormat,
        sign = n < 0 ? "-" : "",
        i = parseInt(n = Math.abs(+n || 0).toFixed(decPlaces)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;

    return sign + currencySymbol + (j ? i.substr(0, j) + thouSeparator : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thouSeparator) + (decPlaces ? decSeparator + Math.abs(n - i).toFixed(decPlaces).slice(2) : "");
};