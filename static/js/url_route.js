const url_route = {
  head: "/includes/head.html",
  menu: "/includes/menu.html",
  script: "/includes/script.html",
  404: "/pages/errors/404.html",
  "/": "/pages/home.html",
  "/discussions": "/pages/discuss.html",
  "/discussions/*/details": "/pages/discussion_detail.html",
  "/techtalk": "/pages/event.html",
  "/techtalk/*/details": "/pages/event_detail.html",
};

const conf = {
  custom_add_syntax: "*",
};

export { url_route, conf };
