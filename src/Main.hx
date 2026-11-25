
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

            var bindProject = (button:Element, project:AnotherProject) -> {
                button.setAttribute('aria-controls', 'description');
                button.setAttribute('aria-pressed', 'false');

                button.onclick = () -> {
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
            };

            bindProject(document.getElementById("sentinel"), {
                projName: 'TERMINAL SQUAD: SENTINEL', 
                projDesc: 'Terminal Squad: Sentinel represents a mixture of different genres, where the player must destroy the waves of enemies as a mech pilot, using the field match3 for charging of assault and protective equipment. The power of enemies and the award for their elimination grow with the progression of levels.', 
                projLink: 'https://store.steampowered.com/app/1118050/Terminal_squad_Sentinel/', 
                projPics: [PROJECT_PREVIEWS + 'sent1.jpg', PROJECT_PREVIEWS + 'sent2.jpg']
            });

            bindProject(document.getElementById("swarmites"), {
                projName: 'TERMINAL SQUAD: SWARMITES', 
                projDesc: 'Terminal squad: swarmites is a game with indirect control where you must erect a chain of buildings, which generate resources for construction or the combat units for destruction of an enemy.', 
                projLink: 'https://store.steampowered.com/app/1217330/Terminal_squad_Swarmites/', 
                projPics: [PROJECT_PREVIEWS + 'swarm1.jpg', PROJECT_PREVIEWS + 'swarm2.jpg']
            });

            bindProject(document.getElementById("space"), {
                projName: 'DEEP SPACE SHOOTER', 
                projDesc: 'The first game of mine which was published on Steam', 
                projLink: 'https://store.steampowered.com/app/972280/Deep_Space_Shooter/', 
                projPics: [PROJECT_PREVIEWS + 'space1.jpg', PROJECT_PREVIEWS + 'space2.jpg']
            });

            bindProject(document.getElementById("mania"), {
                projName: 'RHYTHM MANIA: MUSIC GAME', 
                projDesc: 'A rhythm game for anroid with 10 000+ installs and online highscore tables', 
                projLink: 'https://play.google.com/store/apps/details?id=com.fataliti.rhythm&hl=ru&gl=US', 
                projPics: [PROJECT_PREVIEWS + 'maniagif.webp']
            });

            bindProject(document.getElementById("direct"), {
                projName: 'FATALNY DIRECT', 
                projDesc: 'Standalone osu! beatmap downloader with Tillerino and PPaddict integration', 
                projLink: 'https://fataliti.itch.io/fatalny-direct', 
                projPics: [PROJECT_PREVIEWS + 'direct.jpg']
            });

            bindProject(document.getElementById("katana"), {
                projName: 'KATANA REVERS', 
                projDesc: 'A small game for a gamejam with time manipulations', 
                projLink: 'https://fataliti.itch.io/katana-revers', 
                projPics: [PROJECT_PREVIEWS + 'katana.webp']
            });

            bindProject(document.getElementById("kobeni"), {
                projName: 'CHAINSAW DANCE', 
                projDesc: 'A small rhythm fan game about dancing Kobeni', 
                projLink: 'https://benedique.itch.io/chainsaw-dance', 
                projPics: [PROJECT_PREVIEWS + 'kobeni1.webp', PROJECT_PREVIEWS + 'kobeni2.webp']
            });

            bindProject(document.getElementById("gunvein"), {
                projName: 'GUNVEIN', 
                projDesc: 'Bullethell shoot em up game', 
                projLink: 'https://store.steampowered.com/app/2025840/Gunvein/',
                projPics: [PROJECT_PREVIEWS + 'gunvein1.webp',PROJECT_PREVIEWS + 'gunvein2.webp']
            });

            bindProject(document.getElementById("lucido"), {
                projName: 'LUCIDO CANCELS EVERYTHING', 
                projDesc: 'Psychedelic Beat \'Em Up', 
                projLink: 'https://store.steampowered.com/app/2898730/LUCIDO_Cancels_Everything/',
                projPics: [PROJECT_PREVIEWS + 'lucido_guf_2.webp']
            });

            var norland = document.getElementById("norland");
            bindProject(norland, {
                projName: 'NORLAND', 
                projDesc: 'Norland is a medieval kingdom sim inspired by Rimworld, Crusader Kings, and Caesar that generates complex stories.', 
                projLink: 'https://store.steampowered.com/app/1857090/Norland/',
                projPics: [PROJECT_PREVIEWS + 'norland.webp']
            });

            bindProject(document.getElementById("rgd"), {
                projName: 'RGD Bar', 
                projDesc: 'Small bar for you and your friends', 
                projLink: 'https://fataliti.itch.io/rgd-bar', 
                projPics: [PROJECT_PREVIEWS + 'bar_1.png', PROJECT_PREVIEWS + 'bar_2.png']
            });


            norland.click();

            var extendButton = document.getElementById('extend');
            extendButton.onclick = () -> {
                var otherProjDiv = document.getElementById('otherproj');

                var sideprojects:Array<AnotherProject> = [
                    {
                        projIco: PROJECT_ICONS + 'castoff.png', 
                        projName: 'CASTOFF', 
                        projDesc: 'A small jam games about mages', 
                        projLink: 'https://fataliti.itch.io/cast-off', 
                        projPics: [PROJECT_PREVIEWS + 'castoff2.webp']
                    },
                    {
                        projIco: PROJECT_ICONS + 'rgdbot.webp',
                        projName: 'RGD BOT',
                        projDesc: 'Russian Gamedev Server\'s discord bot made with HAXE',
                        projLink: 'https://github.com/fataliti/RgdBot',
                    }, 
                    {
                        projIco: PROJECT_ICONS + 'podsosbot.webp',
                        projName: 'PODSOS BOT',
                        projDesc: 'Multiserver discord bot which posts pictures from some booru resourses, also made with HAXE',
                        projLink: 'https://github.com/fataliti/Fatalny-podsos',
                    },
                    {
                        projIco: PROJECT_ICONS + 'gmedit.png',
                        projName: 'GMEDIT DISCORD RPC PLUGIN',
                        projDesc: 'The plugin will show your status in Discord',
                        projLink: 'https://github.com/fataliti/GMEdit-Discord-RPC',
                        projPics: [PROJECT_PREVIEWS + 'demo.png']
                    },
                    {
                        projIco: PROJECT_ICONS + 'GMV.png',
                        projName: 'GM VIDEO',
                        projDesc: 'An extension for Game Maker Studio 2 which allow to play videos',
                        projLink: 'https://fataliti.itch.io/gmvideo',
                        projPics: [PROJECT_PREVIEWS + 'video.png']
                    },
                    {
                        projIco: PROJECT_ICONS + 'ShB.png',
                        projName: 'SHADER BRUH',
                        projDesc: 'A tool which allow to make shaders for ame Maker Studio 2 with graphic node editor',
                        projLink: 'https://fataliti.itch.io/shaderbruh',
                        projPics: [PROJECT_PREVIEWS + 'shader.png']
                    },
                    {
                        projIco: PROJECT_ICONS + 'orcico.png',
                        projName: 'ORCS\'S FATE',
                        projDesc: 'One of my first games, russian visual novel about orc',
                        projLink: 'https://fataliti.pro/orc/orc.html',
                        projPics: [PROJECT_PREVIEWS + 'orcimg.png']
                    },
                    {
                        projIco: PROJECT_ICONS + 'evoico.png',
                        projName: 'EVO',
                        projDesc: 'Another one jam game about evolution',
                        projLink: 'https://fataliti.pro/evo/evonext.html',
                        projPics: [PROJECT_PREVIEWS + 'evogif.webp']
                    },

                ];

                for (project in sideprojects) {
                    var column = document.createElement('div');
                    column.className = 'column';

                    var button = document.createButtonElement();
                    button.type = 'button';
                    button.className = 'proj';
                    button.id = 'id_' + project.projName;
                    bindProject(button, project);

                    var img = document.createImageElement();
                    img.className = 'projico';
                    img.alt = project.projName;
                    img.src = project.projIco;
                    button.appendChild(img);
                    column.appendChild(button);
                    otherProjDiv.appendChild(column);
                }

                extendButton.onclick = null;
                extendButton.setAttribute('aria-expanded', 'true');
                otherProjDiv.removeAttribute('hidden');
                otherProjDiv.querySelector('button').focus();
                extendButton.setAttribute('hidden', '');
            }

        }
    }

}


typedef AnotherProject = {
    ?projIco:String,
    projName:String,
    projDesc:String,
    projLink:String,
    ?projPics:Array<String>,
}


