<%-- 
    Document   : submit
    Created on : Jun 3, 2020, 8:50:22 PM
    Author     : Shree
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <style>
            input[type="number"]{
                width: 50px;
            }
        </style>        
        <title>CheckOut</title>
    </head>
    <body>
                <div class="container">
           
                        <table class="table table-hover">
                            <thead class="thead-inverse">
                                <tr>
                                    <th>Qty</th>
                                    <th>Item Name </th>
                                    <th>Cost</th>
                                    <th class="text-xs-right">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody id="output">
                            
                            </tbody>
                        </table>
                    <form action="product_admin.jsp">
                        <input type="submit" value="Submit">
                    </form>
                        <!--<input type="submit" class="btn btn-primary btn-block" value="Checkout with PayPal"> -->
           
            </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            var shopcart=[];
            $(document).ready(function(){
                outputCart();
                $('#output').on('click','.remove-item',function(){
                    var itemInfo = $(this.dataset)[0];
                    var itemToDelete = $('.remove-item').index(this);
                    shopcart.splice(itemToDelete,1);
                        sessionStorage["sca"]=JSON.stringify(shopcart);
                    outputCart();
                    
                })                
                $('#output').on('change keyup','.dynqua', function(){
                    var iteminfo=$(this.dataset)[0];
                    
                    var itemincart=false;
                    var removeItem=false;
                    var itemToDelete=0;
                    console.log(shopcart);
                    var qty=$(this).val();
                    if(qty<0){qty=0;$(this).val(0);}
        $.each(shopcart,function(index,value) {
                        //console.log(index + ' ' + value.id);
                        if(value.id==iteminfo.id){
                            if(qty<=0){
                                removeItem=true;
                                itemToDelete=index;
                            }
                            else{
                                shopcart[index].qty=qty;
                                itemincart=true;
                            }
                            shopcart[index].qty=qty;
                            itemincart=true;
                        }
                    })
                    if(removeItem){
                        shopcart.splice(itemToDelete,1);
                    }

                        sessionStorage["sca"]=JSON.stringify(shopcart);
                    outputCart();                    
                    
                    
                    
                    
                    console.log(sessionStorage["sca"]);
                })
            function outputCart(){
                if(sessionStorage["sca"]!=null){
                    shopcart=JSON.parse(sessionStorage["sca"].toString());
        }
        var holderHTML='';
        var total=0;
        var itemCnt=0;
                    $.each(shopcart,function(index,value) {
                        console.log(index);
                        var stotal= ((value.qty) * (value.price));
                        var a=(index + 1);
                        total+=stotal;
                        itemCnt +=parseInt(value.qty);
        holderHTML += '<tr><td><input type="hidden" class="dynqua" name="quantity'+a+'" value="'
       + value.qty  +'" data-id="'+value.id+'">'+ value.qty  +'</td><td><input type="hidden" name="item_name'+a+
       '" value="'
+ value.name +' ' +value.s + '">' +''+ value.name+'('+value.s+')</td><td><input type="hidden" \n\
name="amount_'+a+'" value="'+ formatMoney(value.price) +'">Rs.'+formatMoney(value.price)+'</td>\n\
<td class="text-xs-right">'+formatMoney(stotal)+'</td></tr>';     
                    })
                    holderHTML +='<tr><td colspan="4" class="text-xs-right"> Total</td>\n\
            <td class="text-xs-right">'+formatMoney(total)+'</td></tr>';
                        $("#output").html(holderHTML);
            }
            function formatMoney(n){
                return  n;
            }                
                
            })
        </script>
    </body>
</html>
