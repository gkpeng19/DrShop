$(function(){$("#openContacts").click(function(){try{var a=$("#platform").val();openContacts(a)}catch(b){alert(b)}})});function openContacts(a){if(a){switch(a){case"apple":window.location.href="objc:callContacts";break;case"android":JdAndroid.callContacts();break;default:window.location.href="objc:callContacts";break}}}function contactsCallBack(a){$("#mobile").val(a);getPhone()}function changeTel(a){$("#tellist li").click(function(){$(this).remove()});var b=$("#mobile").val();$("#tellist").prepend("<li><a href='javascript:void(0);' onclick='changeTel("+b+")'>"+b+"</a></li>");$("#mobile").val(a);$("#tellist").hide()}function showTelList(){if($("#tellist").is(":hidden")){$("#tellist").show()}else{$("#tellist").hide()}}var spiner=createSpinner();var checkMobile=function(){return/^(1)\d{10}$/.test($("#mobile").val())};var fixMobile=function(){var a=$("#mobile").val();if($("#mobile").val().match("-")){a=a.replace(/-/g,"");$("#mobile").val(a)}if($("#mobile").val().match(",")){a=a.replace(/,/g,"");$("#mobile").val(a)}};var getPhone=function(){$("#tellist").hide();fixMobile();$("#area").val("x");$("#provider").val("x");if($("#facePrice").val()==""){$("#price3").addClass("selected");$("#facePrice").val("100.00")}if(!checkMobile()){$("#mobile_err_info").show();$("#info_type").show();$("#price_type").hide();$("#address_type").hide();$("#jdPrice").val("");$("#facePrice").val("");clearPriceIcon();return}else{$("#mobile_err_info").hide()}$("#info_type").hide();$("#price_type").show();$("#address_type").show();$("#price_info").text("\u6b63\u5728\u52aa\u529b\u83b7\u53d6\u4e2d...");$("#addr").text("\u6b63\u5728\u52aa\u529b\u83b7\u53d6\u4e2d...");jQuery.get("/chongzhi/searchPhone.json?",{mobile:$("#mobile").val(),sid:$("#sid").val()},function(a){$("#area").val(a.area==null?"x":a.area);$("#provider").val(a.provider==null?"x":a.provider);$("#mobile_err_info").hide();$("#addr").text(a.address);getSkuIdPrice()},"json")};var getSkuIdPrice=function(){$("#jdPrice").val("");if(!checkMobile()){$("#mobile_err_info").show();$("#info_type").show();$("#price_type").hide();$("#address_type").hide();$("#facePrice").val("");clearPriceIcon();return true}if($("#area").val()=="x"||$("#provider").val()=="x"){$("#info_type").hide();$("#price_type").show();$("#address_type").show();$("#price_info").text("\u65e0\u6cd5\u83b7\u53d6\u4ef7\u683c");$("#addr").text("\u672a\u77e5\u5730\u533a\u548c\u8fd0\u8425\u5546");return true}jQuery.get("/chongzhi/searchSkuIdPrice.json?",{mobile:$("#mobile").val(),area:$("#area").val(),isp:$("#provider").val(),facePrice:$("#facePrice").val(),sid:$("#sid").val()},function(a){if(a!=null){if(a.success=="T"){$("#price_info").text(a.jdPrice+"\u5143");$("#jdPrice").val(a.jdPrice)}else{$("#price_info").text("\u65e0\u6cd5\u83b7\u53d6\u4ef7\u683c");$("#jdPrice").val("")}$("#addr").text(a.address)}else{$("#price_info").text("\u65e0\u6cd5\u83b7\u53d6\u4ef7\u683c");$("#jdPrice").val("")}$("#info_type").hide();$("#price_type").show();$("#address_type").show()},"json")};var changeArea=function(){$("#area").show();$("#provider").show();$("#address_div").hide()};var editAddress=function(){$("#addr").text($("#area").find("option:selected").text()+$("#provider").find("option:selected").text());getSkuIdPrice()};function changePrice(a){$("#jdPrice").val("");$("#price_info").text("\u6b63\u5728\u52aa\u529b\u83b7\u53d6\u4e2d...");clearPriceIcon();saveUserOp(a);switch(a){case 1:$("#price1").addClass("selected");$("#facePrice").val("30.00");if($("#area").val()=="x"&&$("#provider").val()=="x"){getPhone()}else{getSkuIdPrice()}break;case 2:$("#price2").addClass("selected");$("#facePrice").val("50.00");if($("#area").val()=="x"&&$("#provider").val()=="x"){getPhone()}else{getSkuIdPrice()}break;case 3:$("#price3").addClass("selected");$("#facePrice").val("100.00");if($("#area").val()=="x"&&$("#provider").val()=="x"){getPhone()}else{getSkuIdPrice()}break;case 4:$("#price4").addClass("selected");$("#facePrice").val("200.00");if($("#area").val()=="x"&&$("#provider").val()=="x"){getPhone()}else{getSkuIdPrice()}break;case 5:$("#price5").addClass("selected");$("#facePrice").val("300.00");if($("#area").val()=="x"&&$("#provider").val()=="x"){getPhone()}else{getSkuIdPrice()}break;case 6:$("#price6").addClass("selected");$("#facePrice").val("500.00");if($("#area").val()=="x"&&$("#provider").val()=="x"){getPhone()}else{getSkuIdPrice()}break;case 7:$("#price7").addClass("selected");$("#facePrice").val("10.00");if($("#area").val()=="x"&&$("#provider").val()=="x"){getPhone()}else{getSkuIdPrice()}break;case 8:$("#price8").addClass("selected");$("#facePrice").val("20.00");if($("#area").val()=="x"&&$("#provider").val()=="x"){getPhone()}else{getSkuIdPrice()}break;default:$("#facePrice").val("0.00");clearPriceIcon()}}function clearPriceIcon(){$("#price1").removeClass("selected");$("#price2").removeClass("selected");$("#price3").removeClass("selected");$("#price4").removeClass("selected");$("#price5").removeClass("selected");$("#price6").removeClass("selected");$("#price7").removeClass("selected");$("#price8").removeClass("selected")}function showChongZhiSpiner(a){$("#info_type").hide();$("#price_type").show();$("#address_type").show();$("#price_info").hide();$("#chongzhi_wait").show();a.spin($("#chongzhi_wait")[0])}function hideChongZhiSpiner(a){$("#price_info").show();$("#chongzhi_wait").hide();a.stop()}function saveUserOp(a){if(testLocalStorage()){window.localStorage.setItem("chongzhiOp",a)}}function getUserOp(){var a;if(testLocalStorage()){a=window.localStorage.getItem("chongzhiOp")}if(isNotBlank(a)){return a}else{return 3}};