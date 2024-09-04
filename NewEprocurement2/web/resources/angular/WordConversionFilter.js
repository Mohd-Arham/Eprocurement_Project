
/*
 * Filter is used to convert number into words 
 * @param number
 * @return words
 */
myApp.filter('words', function() {
  function isInteger(x) {
        return x % 1 === 0;
    }
  return function(value) {
    if (value && isInteger(value))
      return  dynamicTemplateConv(value);
    return value;
  };


function dynamicTemplateConv(value) {
//                       alert("inside number2text   "+value);
            var fraction = Math.round(frac(value) * 100);
            var f_text = "";
            if (fraction > 0) {
                f_text = "And " + convert_number(fraction) + " Paise";
            }
            var word = convert_number(value);

            if (word !== "" || word !== null) {

                word = word + " Rupees " + f_text + " Only";
            } else {

                word = word + "  " + f_text + " ";

            }
       // alert(word);
        return word;
        }
       

        function frac(f) {
            return f % 1;
        }

   function convert_number(number)
            { 
            //                //alert("inside convert_number");
            
            if ((number < 0) || (number > 9999999999999))
            {
            return "Number Out of Range!";
            }
            var An = Math.floor(number / 1000000000); /* Arab */    
                    number -= An * 1000000000;
                    var Gn = Math.floor(number / 10000000); /* Crore */
                    number -= Gn * 10000000;
                    var kn = Math.floor(number / 100000); /* lakhs */
                    number -= kn * 100000;
                    var Hn = Math.floor(number / 1000); /* thousand */
                    number -= Hn * 1000;
                    var Dn = Math.floor(number / 100); /* Tens (deca) */
                    number = number % 100; /* Ones */
                    var tn = Math.floor(number / 10);
                    var one = Math.floor(number % 10);
                    var res = "";
            if (An > 0)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(An) + " Arab");
            }
            if (Gn > 0)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(Gn) + " Crore");
            }
            if (kn > 0)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(kn) + " Lakh");
            }
            if (Hn > 0)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(Hn) + " Thousand");
            }
            if (Dn)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(Dn) + " Hundred");
            }
            var ones = Array("", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen");
                    var tens = Array("", "", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety");
                    if (tn > 0 || one > 0)
            {
            if (!(res === ""))
            {
            res += " And ";
            }
            if (tn < 2)
            {
            res += ones[tn * 10 + one];
            }
            else
            {
            res += tens[tn];
                    if (one > 0)
            {
            res += ("-" + ones[one]);
            }
            }
            }
            if (res === "")
            {
            res = "Zero";
            }
            return res;
            };

});


/*
 * Filter is used to convert percentage into words 
 * @param number
 * @return words
 */
    myApp.filter('percentage', function () {

    function isInteger(query) {

        return query % 1 === 0;

    }




    return function (value) {

        if (value && isInteger(value))
            return  covertWords(value);


        return value;

    };


});


var myappthos = ['', 'thousand', 'million', 'billion', 'trillion'];

var myappdang = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

var myapptenth = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];

var myapptvew = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];


function covertWords(s)
{
   
    s = s.toString();

    s = s.replace(/[\, ]/g, '');

//    if (s != parseFloat(s))
//        return 'not a number';

    var query = s.indexOf('.');
      alert(query);
    if (query == -1)
        query = s.length;

    if(query > 0)
        covertWords(s);
    
    if (query > 15)
        return 'too big';

    var n = s.split('');

    var str = '';

    var mjk = 0;

    for (var ld = 0; ld < query; ld++)

    {

        if ((query - ld) % 3 == 2)

        {

            if (n[ld] == '1')

            {

                str += myapptenth[Number(n[ld + 1])] + ' ';

                ld++;

                mjk = 1;

            } else if (n[ld] != 0)

            {

                str += myapptvew[n[ld] - 2] + ' ';

                mjk = 1;

            }

        } else if (n[ld] != 0)

        {

            str += myappdang[n[ld]] + ' ';

            if ((query - ld) % 3 == 0)
                str += 'hundred ';

            mjk = 1;

        }


        if ((query - ld) % 3 == 1)

        {

            if (mjk)
                str += myappthos[(query - ld - 1) / 3] + ' ';

            mjk = 0;

        }

    }

    if (query != s.length)

    {

        var dv = s.length;

        str += 'point ';

        for (var ld = query + 1; ld < dv; ld++)
            str += myappdang[n[ld]] + ' ';
       
    }
    alert(str.replace(/\s+/g, ' '));
    return str.replace(/\s+/g, ' ');

}


    window.covertWords = covertWords;



