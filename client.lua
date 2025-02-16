-- Definição das paletas de cores com ajuste automático do texto
local colorPalettes = {
    { name = "🔴 Vermelho",  bg = {255, 0, 0},    text = "#FFFFFF" },
    { name = "🟢 Verde",     bg = {0, 255, 0},    text = "#000000" },
    { name = "🔵 Azul",      bg = {0, 0, 255},    text = "#FFFFFF" },
    { name = "🟡 Amarelo",   bg = {255, 255, 0},  text = "#000000" },
    { name = "🟠 Laranja",   bg = {255, 165, 0},  text = "#000000" },
    { name = "🟣 Roxo",      bg = {128, 0, 128},  text = "#FFFFFF" },
    { name = "⚪ Branco",    bg = {255, 255, 255},text = "#000000" },
    { name = "⚫ Preto",     bg = {0, 0, 0},      text = "#FFFFFF" }
}

-- Opções de anúncios com título e emoji personalizados
local announcementTypes = {
    {
        title = "👑 Administração",
        description = "Notificação a todos",
        emoji = "👑",
        event = "announcement:selectType",
        args = { type = "Administração", emoji = "👑", defaultMessage = "Administração: Notificação a todos" }
    },
    {
        title = "🏛️ Tokyo-Prefeitura",
        description = "Bem-vindos ao novo evento",
        emoji = "🏛️",
        event = "announcement:selectType",
        args = { type = "Tokyo-Prefeitura", emoji = "🏛️", defaultMessage = "Tokyo-Prefeitura: Bem-vindos ao novo evento" }
    },
    {
        title = "🎉 Evento Especial",
        description = "Detalhes do evento especial",
        emoji = "🎉",
        event = "announcement:selectType",
        args = { type = "Evento Especial", emoji = "🎉", defaultMessage = "Evento Especial: Insira os detalhes" }
    }
}

-- Função para abrir o menu de tipos de anúncios
local function openAnnouncementTypeMenu()
    lib.registerContext({
        id = "announcement_type_menu",
        title = "Escolha o Tipo de Anúncio",
        options = announcementTypes
    })
    lib.showContext("announcement_type_menu")
end

-- Função para abrir o input de anúncio
local function openAnnouncementInputMenu(type, emoji, defaultMessage)
    local input = lib.inputDialog(type, {
        { type = 'input', label = 'Mensagem do Anúncio', default = defaultMessage }
    })

    if not input then return end

    local message = input[1]

    -- Menu para escolher a cor da notificação
    local colorMenu = {}
    for _, color in ipairs(colorPalettes) do
        table.insert(colorMenu, {
            title = color.name,
            event = "announcement:submit",
            args = { message = message, title = type, emoji = emoji, bg = color.bg, text = color.text }
        })
    end

    lib.registerContext({
        id = "announcement_color_menu",
        title = "Escolha a Cor do Anúncio",
        options = colorMenu
    })
    lib.showContext("announcement_color_menu")
end

-- Evento para exibir a notificação com título e cor correta
RegisterNetEvent('announcement:submit', function(data)
    local bgColor = string.format("rgb(%d, %d, %d)", data.bg[1], data.bg[2], data.bg[3])

    lib.notify({
        title = string.format("%s %s", data.emoji, data.title),
        description = data.message,
        position = 'top',
        duration = 7000,
        style = { backgroundColor = bgColor, color = data.text }
    })
end)

-- Comando para abrir o menu de tipos de anúncios
RegisterCommand('anuncio', function()
    openAnnouncementTypeMenu()
end, false)

-- Evento para abrir o menu de entrada de anúncio com o título e emoji correto
RegisterNetEvent('announcement:selectType', function(data)
    openAnnouncementInputMenu(data.type, data.emoji, data.defaultMessage)
end)


local Messages = {
    "🚨 *Alerta Cyber!* Um novo evento está prestes a começar na cidade. Prepare-se para o caos! 🔥",
    "🎉 *Promoção High-Tech!* Você desbloqueou uma nova recompensa no sistema. Aproveite enquanto é tempo! 🎮",
    "⚠️ *Atenção, Cidadão!* Mantenha-se conectado para receber prêmios e vantagens exclusivas. Não perca a oportunidade! 💎",
    "🔔 *Comunicado Oficial!* Lembre-se de verificar suas notificações. O futuro da cidade depende disso! 📡",
    "🎮 *Desafios Urbanos!* Os desafios diários estão disponíveis. Conquiste a cidade e prove sua habilidade! 🏙️",
    "🌟 *Atualização Da Cidade!* Novo conteúdo foi adicionado ao servidor. Explore as ruas de Tokyo Edge como nunca antes! 🌆",
    
    -- Novos Anúncios relacionados à atividade e segurança
    "🚨 *Morro da Maconha em Atividade!* As ruas do Morro estão fervendo. Fique atento aos movimentos. 🔥",
    "👮‍♂️ *Policiais do BOPE em Patrulha!* O BOPE está monitorando as ruas de Tokyo Edge. Não tente nada ilegal. 🚔",
    "🚨 *PRF A Postos!* A PRF está em alerta no aeroporto e na zona norte da cidade. Não deixe que a fiscalização pegue você. 🛑",
}


-- Função para exibir uma mensagem aleatória
local function showRandomMessage()
    -- Escolhe uma mensagem aleatória da lista
    local randomMessage = Messages[math.random(1, #Messages)]

    -- Depuração: Imprimir a mensagem escolhida no console
    print("Exibindo mensagem: " .. randomMessage)

    -- Exibe a notificação usando a ox_lib
    lib.notify({
        title = "📢 ALERTA TOKYO EDGE",   -- Pode adicionar um título se quiser
        description = randomMessage,          -- Mensagem aleatória
        position = 'top-right',               -- Posição no canto superior direito
        duration = 5000,                      -- Duração da notificação (em milissegundos)
        style = {                             -- Estilo da notificação
            backgroundColor = { r = 0, g = 0, b = 0, a = 0.8 }, -- Cor de fundo semitransparente
            color = { r = 255, g = 255, b = 255 }             -- Cor do texto
        }
    })
end

-- Função que chama a exibição das mensagens em intervalos
local function startMessageLoop()
    -- Define o tempo de intervalo entre cada mensagem (em milissegundos)
    local interval = 120000  -- 1 minuto (60000ms)

    -- Exibe uma mensagem aleatória a cada intervalo
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(interval)
            showRandomMessage()
        end
    end)
end

-- Inicia o loop de mensagens
startMessageLoop()
