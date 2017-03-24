(function() {
  "use strict";

  angular
    .module("spa-demo.subjects")
    .factory("spa-demo.subjects.TagsAuthz", TagsAuthzFactory);

  TagsAuthzFactory.$inject = ["spa-demo.authz.Authz", "spa-demo.authz.BasePolicy"];

  function TagsAuthzFactory(Authz, BasePolicy) {
    function TagsAuthz() {
      BasePolicy.call(this, "Tag");
    }

    TagsAuthz.prototype = Object.create(BasePolicy.prototype);
    TagsAuthz.constructor = TagsAuthz;

    TagsAuthz.prototype.canQuery = function() {
      return Authz.isAuthenticated();
    };
    TagsAuthz.prototype.canCreate=function() {
      return Authz.isAuthenticated();
    };

    return new TagsAuthz();
  }
})();
