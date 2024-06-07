AM.Webhook = 'https://discord.com/api/webhooks/1248357799902183526/nWxs4DACAS9zbKxAg15UaJluuk9L1liLh0Epq8lVq0Z5m-_ohbx2dCPh--XVwp73_n0a'

AM.SendToDiscord = function(Message, xPlayer)
    local datastext = string.format("```Player Name: %s\nServer ID: %s\nIdentifier: %s```", GetPlayerName(xPlayer.source), xPlayer.source, xPlayer.identifier)

    PerformHttpRequest(AM.Webhook, function(err, text, headers) end, 'POST', json.encode({
        username = "AM Megaphone - Log",
        avatar_url = "https://i.imgur.com/xnzE9rG.png",
        embeds = { {
          description = Message,
          color = 15258703,
          fields = { {
            name = "",
            value = datastext,
            inline = true
          }},
          footer = {
            text = "asd.asd#8057 | "..os.date('%c'),
            icon_url = "https://i.imgur.com/xnzE9rG.png",
            url = "https://google.com/",
          }
        }
    }
}), { ['Content-Type'] = 'application/json' })
end