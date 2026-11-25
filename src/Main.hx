
import js.Browser.document;
import js.Browser.window;
import js.html.Element;

class Main {
    static inline var PROJECT_ICONS = 'assets/images/projects/icons/';
    static inline var PROJECT_PREVIEWS = 'assets/images/projects/previews/';

    static function main() {
        window.onload = function() {
            var divDesc = document.getElementById('description');
            var selectedProject:Element = null;
            var selectBySlug:Map<String, Void -> Void> = [];

            var showProject = (project:AnotherProject) -> {
                if (divDesc.firstElementChild != null) {
                    divDesc.firstElementChild.remove();
                }

                var rootDiv = document.createElement('div');
                var title = document.createElement('h3');
                title.className = 'name project-title';

                var link = document.createAnchorElement();
                link.href = project.projLink;
                link.target = '_blank';
                link.textContent = project.projName;
                title.appendChild(link);
                rootDiv.appendChild(title);

                var par = document.createElement('p');
                par.textContent = project.projDesc;
                par.className = 'name project-copy';
                rootDiv.appendChild(par);

                if (project.projPics != null) {
                    var screenDiv = document.createElement('div');
                    screenDiv.className = 'tab project-screens';
                    for (src in project.projPics) {
                        var img = document.createImageElement();
                        img.className = 'screens';
                        img.alt = '';
                        img.src = src;
                        screenDiv.appendChild(img);
                    }
                    rootDiv.appendChild(screenDiv);
                }

                divDesc.appendChild(rootDiv);
            };

            var bindProject = (button:Element, project:AnotherProject, ?fragment:String) -> {
                var slug = fragment != null ? fragment : button.id;
                button.setAttribute('aria-controls', 'description');
                button.setAttribute('aria-pressed', 'false');

                var select = () -> {
                    if (button == selectedProject) {
                        return;
                    }
                    if (selectedProject != null) {
                        selectedProject.setAttribute('aria-pressed', 'false');
                    }
                    selectedProject = button;
                    button.setAttribute('aria-pressed', 'true');
                    showProject(project);
                };
                selectBySlug.set(slug, select);

                button.onclick = () -> {
                    select();
                    var hash = '#' + slug;
                    if (window.location.hash != hash) {
                        window.history.pushState(null, '', hash);
                    }
                };
            };

            bindProject(document.getElementById("sentinel"), {
                projName: 'TERMINAL SQUAD: SENTINEL', 
                projDesc: 'A mech combat game that blends match-3 puzzles with wave-based battles. Match tiles to charge your weapons and defenses. Enemies grow stronger and rewards increase as you progress.',
                projLink: 'https://store.steampowered.com/app/1118050/Terminal_squad_Sentinel/', 
                projPics: [PROJECT_PREVIEWS + 'sent1.jpg', PROJECT_PREVIEWS + 'sent2.jpg']
            });

            bindProject(document.getElementById("swarmites"), {
                projName: 'TERMINAL SQUAD: SWARMITES', 
                projDesc: 'A strategy game with indirect control. Build a chain of structures that generate resources or produce combat units to defeat the enemy.',
                projLink: 'https://store.steampowered.com/app/1217330/Terminal_squad_Swarmites/', 
                projPics: [PROJECT_PREVIEWS + 'swarm1.jpg', PROJECT_PREVIEWS + 'swarm2.jpg']
            });

            bindProject(document.getElementById("space"), {
                projName: 'DEEP SPACE SHOOTER', 
                projDesc: 'My first game to be released on Steam.',
                projLink: 'https://store.steampowered.com/app/972280/Deep_Space_Shooter/', 
                projPics: [PROJECT_PREVIEWS + 'space1.jpg', PROJECT_PREVIEWS + 'space2.jpg']
            });

            bindProject(document.getElementById("mania"), {
                projName: 'RHYTHM MANIA: MUSIC GAME', 
                projDesc: 'An Android rhythm game with 10,000+ installs and online leaderboards.',
                projLink: 'https://play.google.com/store/apps/details?id=com.fataliti.rhythm&hl=ru&gl=US', 
                projPics: [PROJECT_PREVIEWS + 'maniagif.webp']
            });

            bindProject(document.getElementById("direct"), {
                projName: 'FATALNY DIRECT', 
                projDesc: 'A standalone osu! beatmap downloader with Tillerino and PPaddict integration.',
                projLink: 'https://fataliti.itch.io/fatalny-direct', 
                projPics: [PROJECT_PREVIEWS + 'direct.jpg']
            });

            bindProject(document.getElementById("katana"), {
                projName: 'KATANA REVERS', 
                projDesc: 'A small game jam entry about manipulating time.',
                projLink: 'https://fataliti.itch.io/katana-revers', 
                projPics: [PROJECT_PREVIEWS + 'katana.webp']
            });

            bindProject(document.getElementById("kobeni"), {
                projName: 'CHAINSAW DANCE', 
                projDesc: 'A small rhythm fan game where Kobeni dances to the beat.',
                projLink: 'https://benedique.itch.io/chainsaw-dance', 
                projPics: [PROJECT_PREVIEWS + 'kobeni1.webp', PROJECT_PREVIEWS + 'kobeni2.webp']
            });

            bindProject(document.getElementById("gunvein"), {
                projName: 'GUNVEIN', 
                projDesc: 'A bullet hell shoot \'em up.',
                projLink: 'https://store.steampowered.com/app/2025840/Gunvein/',
                projPics: [PROJECT_PREVIEWS + 'gunvein1.webp',PROJECT_PREVIEWS + 'gunvein2.webp']
            });

            bindProject(document.getElementById("lucido"), {
                projName: 'LUCIDO CANCELS EVERYTHING', 
                projDesc: 'A psychedelic beat \'em up.',
                projLink: 'https://store.steampowered.com/app/2898730/LUCIDO_Cancels_Everything/',
                projPics: [PROJECT_PREVIEWS + 'lucido_guf_2.webp']
            });

            bindProject(document.getElementById("norland"), {
                projName: 'NORLAND', 
                projDesc: 'A medieval kingdom sim inspired by RimWorld, Crusader Kings, and Caesar. Complex stories emerge as you play.',
                projLink: 'https://store.steampowered.com/app/1857090/Norland/',
                projPics: [PROJECT_PREVIEWS + 'norland.webp']
            });

            bindProject(document.getElementById("rgd"), {
                projName: 'RGD Bar', 
                projDesc: 'A small bar for you and your friends.',
                projLink: 'https://fataliti.itch.io/rgd-bar', 
                projPics: [PROJECT_PREVIEWS + 'bar_1.png', PROJECT_PREVIEWS + 'bar_2.png']
            });


            var sideProjects:Array<SideProject> = [
                {
                    projSlug: 'castoff',
                    projIco: PROJECT_ICONS + 'castoff.png',
                    projName: 'CASTOFF',
                    projDesc: 'A small game jam entry about mages.',
                    projLink: 'https://fataliti.itch.io/cast-off',
                    projPics: [PROJECT_PREVIEWS + 'castoff2.webp']
                },
                {
                    projSlug: 'rgd-bot',
                    projIco: PROJECT_ICONS + 'rgdbot.webp',
                    projName: 'RGD BOT',
                    projDesc: 'A Discord bot for the Russian Gamedev Server, built in Haxe.',
                    projLink: 'https://github.com/fataliti/RgdBot',
                },
                {
                    projSlug: 'podsos-bot',
                    projIco: PROJECT_ICONS + 'podsosbot.webp',
                    projName: 'PODSOS BOT',
                    projDesc: 'A Discord bot built in Haxe. It supports multiple servers and posts images from several booru sites.',
                    projLink: 'https://github.com/fataliti/Fatalny-podsos',
                },
                {
                    projSlug: 'gmedit-discord-rpc',
                    projIco: PROJECT_ICONS + 'gmedit.png',
                    projName: 'GMEDIT DISCORD RPC PLUGIN',
                    projDesc: 'A GMEdit plugin that shows your editor activity on Discord.',
                    projLink: 'https://github.com/fataliti/GMEdit-Discord-RPC',
                    projPics: [PROJECT_PREVIEWS + 'demo.png']
                },
                {
                    projSlug: 'gm-video',
                    projIco: PROJECT_ICONS + 'GMV.png',
                    projName: 'GM VIDEO',
                    projDesc: 'A GameMaker Studio 2 extension for playing videos.',
                    projLink: 'https://fataliti.itch.io/gmvideo',
                    projPics: [PROJECT_PREVIEWS + 'video.png']
                },
                {
                    projSlug: 'shader-bruh',
                    projIco: PROJECT_ICONS + 'ShB.png',
                    projName: 'SHADER BRUH',
                    projDesc: 'A visual, node-based shader editor for GameMaker Studio 2.',
                    projLink: 'https://fataliti.itch.io/shaderbruh',
                    projPics: [PROJECT_PREVIEWS + 'shader.png']
                },
                {
                    projSlug: 'orcs-fate',
                    projIco: PROJECT_ICONS + 'orcico.png',
                    projName: 'ORCS\'S FATE',
                    projDesc: 'A Russian-language visual novel about an orc. It was one of my first games.',
                    projLink: 'https://fataliti.pro/orc/orc.html',
                    projPics: [PROJECT_PREVIEWS + 'orcimg.png']
                },
                {
                    projSlug: 'evo',
                    projIco: PROJECT_ICONS + 'evoico.png',
                    projName: 'EVO',
                    projDesc: 'A game jam entry about evolution.',
                    projLink: 'https://fataliti.pro/evo/evonext.html',
                    projPics: [PROJECT_PREVIEWS + 'evogif.webp']
                },
            ];

            var extendButton = document.getElementById('extend');
            var otherProjDiv = document.getElementById('otherproj');

            var expandProjects = (focusFirst:Bool) -> {
                if (!otherProjDiv.hasAttribute('hidden')) {
                    return;
                }

                for (project in sideProjects) {
                    var column = document.createElement('div');
                    column.className = 'column';

                    var button = document.createButtonElement();
                    button.type = 'button';
                    button.className = 'proj';
                    button.id = 'id_' + project.projName;
                    bindProject(button, project, project.projSlug);

                    var img = document.createImageElement();
                    img.className = 'projico';
                    img.alt = project.projName;
                    img.src = project.projIco;
                    button.appendChild(img);
                    column.appendChild(button);
                    otherProjDiv.appendChild(column);
                }

                extendButton.setAttribute('aria-expanded', 'true');
                otherProjDiv.removeAttribute('hidden');
                if (focusFirst) {
                    otherProjDiv.querySelector('button').focus();
                }
                extendButton.setAttribute('hidden', '');
            };
            extendButton.onclick = () -> expandProjects(true);

            var selectFromUrl = () -> {
                var slug = window.location.hash.substr(1);
                if (!selectBySlug.exists(slug) && Lambda.exists(sideProjects, project -> project.projSlug == slug)) {
                    expandProjects(false);
                }

                var select = selectBySlug.get(slug);
                if (select == null) {
                    select = selectBySlug.get('norland');
                }
                select();
            };

            window.addEventListener('hashchange', _ -> selectFromUrl());
            window.addEventListener('popstate', _ -> selectFromUrl());
            selectFromUrl();

        }
    }

}


typedef AnotherProject = {
    projName:String,
    projDesc:String,
    projLink:String,
    ?projPics:Array<String>,
}

private typedef SideProject = {
    > AnotherProject,
    projSlug:String,
    projIco:String,
}


