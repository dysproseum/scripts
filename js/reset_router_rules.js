function run(start, limit) {
  console.log(start);
  if (start >= limit) return;

  var curl = "http://192.168.0.1/as_advancedportforwarding.cgi?action=remove&instance=" + start + "&sessionKey=1827193950&_=1486141918812";
  $.get(curl, function() {
      start++;
      run(start, limit)
    }
  );
}
run(5001, 10000);
