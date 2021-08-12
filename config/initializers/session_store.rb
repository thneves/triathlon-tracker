# define how the cookies structure will be like

Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "tritracker.herokkuapp.com"