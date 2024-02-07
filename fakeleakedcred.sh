#Simulating leaking credentials
tenantId="3e0a744b-c0c8-4a74-bae7-a86f8268ae11"
clientId="24d97a14-045e-4229-a1ab-a442cf377375"
clientSecret="-----LwG8Q~2MGkc2zMJWoLaS21NOSNHSNv2ZsSb5ybqy"
resource="https://graph.microsoft.com" 

# Crea il corpo della richiesta
body="resource=$resource&client_id=$clientId&client_secret=$clientSecret&grant_type=client_credentials"

# Invia la richiesta POST
response=$(curl -s -X POST -d $body https://login.microsoftonline.com/$tenantId/oauth2/token)

# Estrai il token di accesso dalla risposta
accessToken=$(echo $response | jq -r '.access_token')

# Stampa il token di accesso
if [ "$accessToken" != "" ]
then
  echo "Autenticazione riuscita con successo! Il tuo token di accesso è: $accessToken"
else
  echo "Autenticazione fallita."
fi
