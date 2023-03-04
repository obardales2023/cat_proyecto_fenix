function DiaHora() {
    var d = new Date();
    var dia = 100+d.getDate();
    var mes = 100+d.getMonth()+1;
    var yyyy = d.getFullYear();
    var hh = 100+d.getHours();
    var mm = 100+d.getMinutes();
    var ss = 100+d.getSeconds();

	var diahora = yyyy + "-" + mes.toString().substring(1) + "-" + dia.toString().substring(1) + " " + hh.toString().substring(1) + ":" + mm.toString().substring(1) + ":" + ss.toString().substring(1);
	
	return diahora;
}

