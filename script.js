HTTP_GET_VARS = [];

strGET = document.location.search.substr(1, document.location.search.length);

if (strGET !== '') {
  gArr = strGET.split('&');
  for (i = 0; i < gArr.length; ++i) {
    v = '';
    vArr = gArr[i].split('=');
    if (vArr.length > 1) {
      v = vArr[1];
    }
    HTTP_GET_VARS[unescape(vArr[0])] = unescape(v);
  }
}

function GET(v) {
  if (!HTTP_GET_VARS[v]) {
    return 'undefined';
  }
  return HTTP_GET_VARS[v];
}
