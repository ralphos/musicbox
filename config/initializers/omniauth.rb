Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "E6G5gEsjjJkdtHrEeEPsA", "gbJCNFyaO08iAMGfxE0QpPE7zMxoJH2xGpw8f1Gmo"
  provider :facebook, "421794637839387", "120f0652202580a54d24d215a4dd3f61" 
end