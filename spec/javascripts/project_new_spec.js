describe("NewProjectHelper", function() {
  it("hides the new link", function() {
    var result = { good: "no" };
    var url='http://localhost:3000/projects';
    var authenticity_token='pSa1WsQTEMCzx6GcxhYdW8saSISL6liXcACUY7h7RUk=';
    var data="utf8=✓&authenticity_token=" + authenticity_token + "&project[name]=testing&project[technologies_used]=rails&commit=Create+Project";
    $.post(url, data, function() { result.good = 'success'; }, 'script');
    expect(result.good.toEqual('success'));
  });
});
