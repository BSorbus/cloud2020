function isEmpty(val){
  return (val === undefined || val == null || val.length <= 0) ? true : false;
};

function ifNullToEmptyStr(val){
  return (val === undefined || val == null || val.length <= 0) ? "" : val;
};

function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
};