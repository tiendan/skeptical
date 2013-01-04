function getParameterByName(name)
{
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regexS = "[\\?&]" + name + "=([^&#]*)";
  var regex = new RegExp(regexS);
  var results = regex.exec(window.location.search);
  if(results == null)
    return "";
  else
    return decodeURIComponent(results[1].replace(/\+/g, " "));
}

function endsWith(str, suffix) {
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function get_comma_separated_select_values(select_name) {
     var selMulti = $.map($(select_name + " option:selected"), function (el, i) {
         return $(el).val();
     });
     return selMulti.join(",");
}

function extract_parameter_value_from_url(url, param) {
	parameter_start = url.indexOf(param + "=");
	
	if(parameter_start < 0) {
		return "";
	}
	
	parameter_end = url.indexOf("&", parameter_start);
	
	if(parameter_end < 0) {
		parameter_end = url.length;
	}
	
	return url.substring(parameter_start+param.length+1, parameter_end);
}

function replace_pagination_links() {
	$("#pagination a").each(function () {
		target_page = extract_parameter_value_from_url(this.href, "page");
		current_page = extract_parameter_value_from_url(location.href, "sayfa");
			
		if(current_page == "") {
			if(endsWith(location.href, "human_names")) {
				this.href = location.href + "?sayfa=" + target_page;
			}
			else {
				this.href = location.href + "&sayfa=" + target_page;
			}
		}
		else {
			this.href = location.href.replace("sayfa=" + current_page, "sayfa=" + target_page);
		}
	});
}

function submit_search(keep_page_count) {
	$("#cinsiyet").val(get_comma_separated_select_values("#cinsiyet_coklu"));
	$("#koken").val(get_comma_separated_select_values("#koken_coklu"));
	$("#ilk").val(get_comma_separated_select_values("#ilk_coklu"));
	
	var pathname = window.location.toString();
	pathname = pathname.substring(0, pathname.lastIndexOf('/'))
	pathname += "/human_names?"
	
	if(!keep_page_count) {
		$('#sayfa').val("");
	}
	
	if($('#cinsiyet').val() != "") {
		pathname += "&cinsiyet=" + $('#cinsiyet').val();
	}
	
	if($('#ilk').val() != "") {
		pathname += "&ilk=" + $('#ilk').val();
	}
	
	if($('#koken').val() != "") {
		pathname += "&koken=" + $('#koken').val();
	}
	
	if($('#dogal').is(":checked")) {
		pathname += "&dogal=1"
	}
	
	if($('#turkce').is(":checked")) {
		pathname += "&turkce=0"
	}
	
	if(keep_page_count) {
		if($('#sayfa').val() != "") {
			pathname += "&sayfa=" + $('#sayfa').val();
		}
	}
	
	pathname = pathname.replace("?&", "?");
	
	if(endsWith(pathname, "?")) {
		pathname = pathname.substring(0, pathname.length-1);
	}
	
	$('#search_form').submit();
	
    history.pushState(null, "", pathname);
}

$(document).ready(function(){
   $("#cinsiyet_coklu").multiselect( {
		checkAllText: "Hepsi",
		uncheckAllText: "Hiçbiri",
		noneSelectedText: "Bir cinsiyet seçin",
		selectedList: 5,
		selectedText: "# cinsiyet seçili",
		header: false,
		height: 80,
		show: ["slide", { direction: "up" }, 20]
	});
	
   $("#koken_coklu").multiselect( {
		checkAllText: "Hepsi",
		uncheckAllText: "Hiçbiri",
		noneSelectedText: "Bir dil seçin",
		selectedList: 4,
		selectedText: "# dil seçili",
		show: ["slide", { direction: "up" }, 20]
	});
	
   $("#ilk_coklu").multiselect( {
		checkAllText: "Hepsi",
		uncheckAllText: "Hiçbiri",
		noneSelectedText: "Bir harf seçin",
		selectedList: 8,
		selectedText: "# harf seçili",
		show: ["slide", { direction: "up" }, 20]
	});
	
	$('#pagination a').live('click', function (e) {  
    	//history.pushState(null, "", this.href);
    	//$.getScript(this.href);
		clicked_link = $(e.target).text();
		
		current_page = parseInt($("#sayfa").val(), 10);
		current_page = current_page ? current_page : 1;
	
		if(clicked_link == "←") {
			$("#sayfa").val(current_page - 1);
		}
		else if (clicked_link == "→") {
			$("#sayfa").val(current_page + 1);
		}
		else {
			$("#sayfa").val(clicked_link);
		}
		submit_search(true);
    	return false;
  	});

});

$(function () {
  // Other functions omitted.
  $(window).bind("popstate", function () {
	//alert('yeah');
    //submit_search(true);
	$.get(location.href);
  });
})
