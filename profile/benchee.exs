map_fun = fn i -> [i, i * i] end
singular_words = [
  "child", "peg", "mouse", "man", "tooth",
  "foot", "person", "leaf", "half", "knife",
  "wife", "life", "elf", "loaf", "potato", "hero",
  "echo", "tomato", "torpedo", "veto", "cactus",
  "focus", "fungus", "nucleus", "syllabus",
  "ox", "goose", "child", "woman", "tooth",
  "foot", "mouse", "louse", "man", "cactus",
  "focus", "fungus", "nucleus", "syllabus",
  "phenomenon", "criterion", "datum", "analysis",
  "diagnosis", "oasis", "thesis", "crisis",
  "hippopotamus", "octopus", "radius", "status",
  "prospectus", "bacterium", "stimulus", "terminus",
  "spectrum", "speculum", "embargo", "hero", "mosquito",
  "potato", "tomato", "torpedo", "veto", "index",
  "appendix", "criterion", "phenomenon", "automaton",
  "datum", "antenna", "formula", "nebula", "vertebra",
  "vitamin"]
plural_words = [
  "children", "pegs", "mice", "men", "teeth",
  "feet", "people", "leaves", "halves", "knives",
  "wives", "lives", "elves", "loaves", "potatoes", "heroes",
  "echoes", "tomatoes", "torpedoes", "vetoes", "cacti",
  "foci", "fungi", "nuclei", "syllabi",
  "oxen", "geese", "children", "women", "teeth",
  "feet", "mice", "lice", "men", "cacti",
  "foci", "fungi", "nuclei", "syllabi",
  "phenomena", "criteria", "data", "analyses",
  "diagnoses", "oases", "theses", "crises",
  "hippopotami", "octopuses", "radii", "statuses",
  "prospectuses", "bacteria", "stimuli", "termini",
  "spectra", "specula", "embargoes", "heroes", "mosquitoes",
  "potatoes", "tomatoes", "torpedoes", "vetoes", "indices",
  "appendices", "criteria", "phenomena", "automata",
  "data", "antennae", "formulae", "nebulae", "vertebrae",
  "vitamins"
]

strings_for_camelize = [
  "first_name", "last_name", "email_address",
  "user_name", "password", "confirm_password",
  "remember_me", "sign_in", "sign_out",
  "profile_picture", "cover_photo", "bio",
  "website", "location", "date_of_birth",
  "gender", "phone_number", "security_question",
  "security_answer", "terms_and_conditions",
  "privacy_policy", "forgot_password", "reset_password",
  "change_password", "update_profile", "delete_account",
  "create_account", "verify_email",
  "send_verification_email", "resend_verification_email",
  "change_email", "update_email", "delete_email", "add_email",
  "primary_email", "secondary_email", "work_email", "personal_email",
  "school_email", "university_email", "company_email",
  "business_email", "emergency_contact", "billing_address",
  "shipping_address", "credit_card_number", "expiry_date",
  "cvv", "card_holder_name", "save_card_for_future_use",
  "remove_card", "update_card", "add_new_card", "default_card",
  "order_history", "wishlist", "cart", "checkout", "apply_coupon",
  "remove_coupon", "update_quantity", "remove_from_cart",
  "add_to_cart", "buy_now", "track_order", "cancel_order", "return_order",
  "exchange_order", "customer_support", "live_chat", "send_message",
  "receive_message", "read_message", "unread_message", "delete_message",
  "archive_message", "report_message", "block_user", "unblock_user",
  "follow_user", "unfollow_user", "mute_user",
  "unmute_user", "report_user", "block_user"
]

strings_for_parameterize = [
  "firstName lastName", "emailAddress%20userName", "password confirmPassword",
  "rememberMe signIn", "signOut%20profilePicture", "coverPhoto bio",
  "website%20location", "dateOfBirth gender", "phoneNumber securityQuestion",
  "securityAnswer termsAndConditions", "privacyPolicy forgotPassword",
  "resetPassword%20changePassword", "updateProfile deleteAccount",
  "createAccount verifyEmail", "sendVerificationEmail resendVerificationEmail",
  "changeEmail%20updateEmail", "deleteEmail addEmail", "primaryEmail secondaryEmail",
  "workEmail%20personalEmail", "schoolEmail universityEmail", "companyEmail businessEmail",
  "emergencyContact billingAddress", "shippingAddress creditCardNumber",
  "expiryDate%20cvv", "cardHolderName saveCardForFutureUse", "removeCard updateCard",
  "addNewCard defaultCard", "orderHistory wishlist", "cart checkout",
  "applyCoupon%20removeCoupon", "updateQuantity removeFromCart", "addToCart buyNow",
  "trackOrder cancelOrder", "returnOrder exchangeOrder", "customerSupport liveChat",
  "sendMessage%20receiveMessage", "readMessage unreadMessage", "deleteMessage archiveMessage",
  "reportMessage blockUser", "unblockUser followUser", "unfollowUser muteUser",
  "unmuteUser%20reportUser", "blockUser firstName", "lastName emailAddress",
  "userName%20password", "confirmPassword rememberMe", "signIn signOut",
  "profilePicture coverPhoto", "bio website", "location%20dateOfBirth", "gender phoneNumber",
  "securityQuestion securityAnswer", "termsAndConditions privacyPolicy",
  "forgotPassword%20resetPassword", "changePassword updateProfile", "deleteAccount createAccount",
  "verifyEmail sendVerificationEmail", "resendVerificationEmail changeEmail",
  "updateEmail%20deleteEmail", "addEmail primaryEmail", "secondaryEmail workEmail",
  "personalEmail schoolEmail", "universityEmail%20companyEmail", "businessEmail emergencyContact",
  "billingAddress shippingAddress", "creditCardNumber expiryDate", "cvv cardHolderName",
  "saveCardForFutureUse%20removeCard", "updateCard addNewCard", "defaultCard orderHistory",
  "wishlist cart", "checkout applyCoupon", "removeCoupon%20updateQuantity", "removeFromCart addToCart",
  "buyNow trackOrder", "cancelOrder returnOrder", "exchangeOrder customerSupport",
  "liveChat%20sendMessage", "receiveMessage readMessage", "unreadMessage deleteMessage",
  "archiveMessage reportMessage", "blockUser%20unblockUser", "followUser unfollowUser",
  "muteUser unmuteUser", "reportUser blockUser"
]

camelize_test = fn ->
  for _ <- 0..10 do
    Enum.map(strings_for_camelize, &Inflex.camelize/1)
  end
end

ordinalize_test = fn ->
  Enum.map(0..1000, &Inflex.ordinalize/1)
end

parameterize_test = fn ->
  for _ <- 0..10 do
    Enum.map(strings_for_parameterize, &Inflex.parameterize/1)
  end
end

pluralize_test = fn ->
  for _ <- 0..10 do
    Enum.map(singular_words ++ plural_words, &Inflex.pluralize/1)
  end
end

singularize_test = fn ->
  for _ <- 0..10 do
    Enum.map(singular_words ++ plural_words, &Inflex.singularize/1)
  end
end

Benchee.run(
  %{
    "camelize" => fn -> camelize_test.() end,
    "ordanalize" => fn -> ordinalize_test.() end,
    "parameterize" => fn -> parameterize_test.() end,
    "pluralize" => fn -> pluralize_test.() end,
    "singularize" => fn -> singularize_test.() end,
  },
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown,
      file: __DIR__ <> "/BENCHEE.md",
      description: """
      Inflex exhaustive benchee report.
      """
    }
  ]
)
