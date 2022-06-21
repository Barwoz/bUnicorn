Config = {}

Config.Control = 'F6'
Config.InitESX = 'esx:getSharedObject'

Config.blipsUnicorn = {
    {title="Bar | ~p~Unicorn~s~", colour=61, id=121, x = 112.82, y = -1286.95, z = 28.26},
}

Config.EnabledPeds = true

Config.Peds = {
  {ped="s_f_y_stripper_01", pos=vector3(109.53, -1311.90, 29.74), d1="anim@amb@nightclub@lazlow@hi_railing@", d2="ambclub_13_mi_hi_sexualgriding_laz"},
  {ped="s_f_y_stripper_02", pos=vector3(106.73, -1313.79, 29.74), d1="anim@amb@nightclub@lazlow@hi_railing@", d2="ambclub_12_mi_hi_bootyshake_laz"},
  {ped="a_f_y_topless_01", pos=vector3(112.34, -1310.30, 29.74), d1="anim@amb@nightclub@lazlow@hi_railing@", d2="ambclub_09_mi_hi_bellydancer_laz"},
}

Config.Cocktail = {
  {
    name='presquesante', 
    label='Presque Santé', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  Gin Seventh Heaven\n -  Liqueur d\'orange\n -  Jus de Citron\n -  Jus de Pamplemouse\n -  Glaçons', 
    price=25, 
    i1='gin', 
    i2='liqueurorange', 
    i3='juscitron', 
    i4='juspamplemouse', 
    i5='glacon',
  },
  {
    name='rosemarie', 
    label='Rose-Marie', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  Gin Ungava\n -  Sirop de Thé\n -  Jus de Citron\n -  Jus de Canneberge Blanche\n -  Branche de Romarin x2', 
    price=22, 
    i1='gin', 
    i2='siropthea', 
    i3='juscitron', 
    i4='juscanneberge', 
    i5='brancheromarin',
  },
  {
    name='sangria', 
    label='Sangria Club-Med', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  Vin Blanc\n -  Liqueur Curaçao Bleu\n -  Jus d\'Ananas\n -  Limonade\n -  Glaçons', 
    price=20, 
    i1='glacon', 
    i2='vinblanc', 
    i3='liqueurcuracaobleu', 
    i4='jusananaas', 
    i5='limonade',
  },
  {
    name='nouvellefrance', 
    label='Nouvelle France', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  Hennesy\n -  Poire Williams\n -  Sirop de Romarin\n -  Jus de Citron\n -  1/2 Poire Bosc\n -  2 Poires de Dillon\'s Romarin', 
    price=17, 
    i1='henesy', 
    i2='poire', 
    i3='siropromarin',
    i4='juscitron', 
    i5='poire',
  },
  {
    name='oldfashioned', 
    label='Old Fashioned', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  2 Bourbon Wild-Turkey\n -  1 Cube de Sucre Brun\n -  3 trais d\'Amer Angostura', 
    price=15, 
    i1='bourbon', 
    i2='sucrebrin', 
    i3='angostura', 
    i4='angostura', 
    i5='angostura',
  },
  {
    name='martini', 
    label='Martini', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  Gin Monkey 47 Schwarzwald Dry\n -  1 Vermouth\n -  Zestes de Citron\n -  Glaçons', 
    price=12, 
    i1='gin', 
    i2='vermouth', 
    i3='citron', 
    i4='citron', 
    i5='glacon',
  },
  {
    name='pinacoladaananas', 
    label='Pina Colada d\'Ananas', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  Ananas Coupé en Dés\n -  Glaçons\n -  Crème de Coco Sucré\n -  Rhum Brun\n -  Cerise au Marasquin\n -  Tranche d\'Ananas', 
    price=10, 
    i1='ananas', 
    i2='glacon', 
    i3='cremecoco', 
    i4='rhum', 
    i5='cerise'
  },
  {
    name='mojito', 
    label='Mojito', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  Rhum Blanc\n -  Sirop de Sucr de Canne\n -  Feuilles de Menthe\n -  Citron Vert\n -  Eau Gazeuze\n -  Glaçons', 
    price=12, 
    i1='rhum',
    i2='siropcanne', 
    i3='menthe', 
    i4='citronvert', 
    i5='watergaz',
  },
  {
    name='valhalla', 
    label='Valhalla', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -   Conde Lumar\n -  Glaçons', 
    price=38, 
    i1='condelumar', 
    i2='glacon', 
    i3='', 
    i4='', 
    i5='',
  },
  {
    name='vanilla', 
    label='Vanilla', 
    desc='Voici les ~b~Ingrédients~s~ du ~p~Cocktail~s~ :\n -  Café Noir\n -  Arome de Vanille\n -  Chantilly\n -  Gousse de Vanille\n -  Glaçons', 
    price=25, 
    i1='cafe', 
    i2='aromevanille', 
    i3='chantilly', 
    i4='goussevanille', 
    i5='glacon',
  },
}

Config.Courses = {
  {name='water', label='Eau', price=3},
  {name='cocacola', label='Coca-Cola', price=3},
  {name='icetea', label='Ice-Tea', price=3},
  {name='bierre', label='Bierre', price=3},
  {name='chips', label='Bol de Chips', price=3},
  {name='cacahuete', label='Cacahuete', price=3},
  {name='gin', label='Gin', price=3},
  {name='liqueurorange', label='Liqueur d Orange', price=3},
  {name='juscitron', label='Jus de Citron', price=3},
  {name='brancheromarin', label='Branche de Romarin', price=3},
  {name='juspamplemouse', label='Jus de Pamplemouse', price=3},
  {name='siropthea', label='Sirop de Thé', price=3},
  {name='juscanneberge', label='Jus de Canneberge Blanche', price=3},
  {name='vinblanc', label='Vins Blanc', price=3},
  {name='liqueurcuracaobleu', label='Liqueur de Curacao Bleu', price=3},
  {name='jusananaas', label='Jus d Ananas', price=3},
  {name='limonade', label='Limonade', price=3},
  {name='hanesy', label='Hanesy', price=3},
  {name='poire', label='Poire', price=3},
  {name='siropromarin', label='Sirop de Romarin', price=3},
  {name='sucrebrin', label='Morceau de Sucre Brin', price=3},
  {name='angostura', label='Angostura', price=3},
  {name='bourbon', label='Bourbon Wild Turkey', price=3},
  {name='citron', label='Citron', price=3},
  {name='vermouth', label='Vermouth', price=3},
  {name='ananas', label='Ananas', price=3},
  {name='glacon', label='Glaçons', price=3},
  {name='siropcanne', label='Sirop de Sucre de Canne', price=3},
  {name='rhum', label='Rhum', price=3},
  {name='cremecoco', label='Crème de Coco Sucré', price=3},
  {name='menthe', label='Menthe', price=3},
  {name='cerise', label='Cerise', price=3},
  {name='citronvert', label='Bol de Chips', price=3},
  {name='watergaz', label='Eau Gazeuze', price=3},
  {name='condelumar', label='Conde Lumar', price=3},
  {name='cafe', label='Café Noir', price=3},
  {name='aromevanille', label='Arôme de Vanille', price=3},
  {name='chantilly', label='Chantillly', price=3},
  {name='goussevanille', label='Gousse de Vanille', price=3},
}

Config.MarkerUni = {
  ["Vestiaire_Uni"]={
    marker = true,
    position = vector3(109.43, -1305.26, 29.25),
    color = {r = 150, g = 0, b = 40, a = 255},
    help = "Appuyez sur [~b~E~s~] pour accèder au Vestiaire du ~p~Unicorn~s~ !",
    interact = function()
      OpenCloakMenuUni()
    end
  },  
  ["Boss_Uni"]={
      marker = true,
      position = vector3(97.84, -1303.63, 29.25),
      color = {r = 150, g = 0, b = 40, a = 255},
      help = "Appuyez sur [~b~E~s~] pour accèder à la Gestion du ~p~Unicorn~s~ !",
      interact = function()
          OpenBossMenuUni()
      end
  },
  ["Veh_Uni"]={
    marker = true,
    position = vector3(136.83, -1278.48, 29.35),
    color = {r = 150, g = 0, b = 40, a = 255},
    help = "Appuyez sur [~b~E~s~] pour accèder au Garage du ~p~Unicorn~s~ !",
    interact = function()
        OpenVehMenuUni()
    end
  },  
  ["Recolte_Uni"]={
    marker = true,
    position = vector3(137.90, -3110.81, 5.89),
    color = {r = 150, g = 0, b = 40, a = 255},
    help = "Appuyez sur [~b~E~s~] pour accèder à la Récolte du ~p~Unicorn~s~ !",
    interact = function()
      OpenMenuRecolteUni()
    end
  },  
  ["Traitement_Uni"]={
    marker = true,
    position = vector3(-51.05, 1901.11, 195.36),
    color = {r = 150, g = 0, b = 40, a = 255},
    help = "Appuyez sur [~b~E~s~] pour accèder au traitement du ~p~Unicorn~s~ !",
    interact = function()
      OpenMenuTraitementUni()
    end
  },  
  ["Vente_Uni"]={
    marker = true,
    position = vector3(-708.36, -904.75, 19.21),
    color = {r = 150, g = 0, b = 40, a = 255},
    help = "Appuyez sur [~b~E~s~] pour accèder à la vente du ~p~Unicorn~s~ !",
    interact = function()
      OpenMenuVenteUni()
    end
  },  
  ["Melange_Uni"]={
    marker = true,
    position = vector3(130.03, -1284.93, 29.25),
    color = {r = 150, g = 0, b = 40, a = 255},
    help = "Appuyez sur [~b~E~s~] pour accèder aux Coktails du ~p~Unicorn~s~ !",
    interact = function()
      OpenMenuCocktailUni()
    end
  },  
  ["Courses_Uni"]={
    marker = true,
    position = vector3(1085.19, -2289.46, 30.22),
    color = {r = 150, g = 0, b = 40, a = 255},
    help = "Appuyez sur [~b~E~s~] pour accèder aux Achats du ~p~Unicorn~s~ !",
    interact = function()
      OpenMenuAchatUni()
    end
  },  
  ["Coffre_Uni"]={
    marker = true,
    position = vector3(124.38, -1278.84, 29.25),
    color = {r = 150, g = 0, b = 40, a = 255},
    help = "Appuyez sur [~b~E~s~] pour accèder au Coffre du ~p~Unicorn~s~ !",
    interact = function()
      OpenMenuTrunkUnicorn()
    end
  }, 
}