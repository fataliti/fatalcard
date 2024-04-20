
import js.html.Console;
import js.Browser.document;
import js.Browser.window;

class Main {

    static var is_extended = false;
    static var selected_pic:js.html.Element = null;

    static function main() {
        window.onload = function() {

            var divDesc = document.getElementById('description');

            var setDesc = (proj:String, desc:String, ?imgs:Array<String>, link:String = '') -> {
                if (divDesc.firstElementChild != null) {
                    divDesc.firstElementChild.remove();
                }

                var rootDiv = document.createElement('div');
                
                var _link = document.createElement('a');
                _link.setAttribute('href', link);
                _link.setAttribute('target', '_blank');
                _link.setAttribute('style', 'color: #000000;');

                var h4 = document.createElement('h4');
                h4.textContent = proj;
                h4.className = 'name';
                h4.setAttribute('style', 'text-align: center; font-size: 20px; margin-top: 5px');

                _link.appendChild(h4);

                var par = document.createElement('p');
                par.textContent = desc;
                par.className = 'name';
                par.setAttribute('style', 'text-align: center; font-size: 20px; width: 500px;  margin: auto; font-weight: 600; margin-top: -25px');
                
                var screenDiv = document.createElement('div');
                screenDiv.className = 'tab';
                
                if (imgs != null) {
                    for (s in imgs) {
                        var _img = document.createElement('img');
                        _img.className = 'screens';
                        _img.setAttribute('src', s);
                        screenDiv.appendChild(_img);
                    }
                }

                rootDiv.appendChild(_link);
                rootDiv.appendChild(par);
                rootDiv.appendChild(screenDiv);
                divDesc.appendChild(rootDiv);
            }
            
            var bind_click_to_link = function(_link_id:String, _project:AnotherProject):Void {
                var element = document.getElementById(_link_id);
                var picture = element.firstElementChild;

                picture.onmouseover = function () {
                    if (picture != selected_pic) {
                        picture.className = 'projicoact';
                    }
                }
                picture.onmouseout = function () {
                    if (picture != selected_pic) {
                        picture.className = 'projico';
                    }
                }

                element.onclick = function() {
                    if (selected_pic != null) {
                        selected_pic.className = 'projico';
                    }
                    selected_pic = picture;
                    selected_pic.className = 'projico_selected';
                    setDesc(_project.projName,  _project.projDesc, _project.projPics, _project.projLink);
                }
            }

            bind_click_to_link("sentinel", {
                projName: 'TERMINAL SQUAD: SENTINEL', 
                projDesc: 'Terminal Squad: Sentinel represents a mixture of different genres, where the player must destroy the waves of enemies as a mech pilot, using the field match3 for charging of assault and protective equipment. The power of enemies and the award for their elimination grow with the progression of levels.', 
                projLink: 'https://store.steampowered.com/app/1118050/Terminal_squad_Sentinel/', 
                projPics: ['sent1.jpg', 'sent2.jpg']
            });

            bind_click_to_link("swarmites", {
                projName: 'TERMINAL SQUAD: SWARMITES', 
                projDesc: 'Terminal squad: swarmites is a game with indirect control where you must erect a chain of buildings, which generate resources for construction or the combat units for destruction of an enemy.', 
                projLink: 'https://store.steampowered.com/app/1217330/Terminal_squad_Swarmites/', 
                projPics: ['swarm1.jpg', 'swarm2.jpg']
            });

            bind_click_to_link("space", {
                projName: 'DEEP SPACE SHOOTER', 
                projDesc: 'The first game of mine which was published on Steam', 
                projLink: 'https://store.steampowered.com/app/972280/Deep_Space_Shooter/', 
                projPics: ['space1.jpg', 'space2.jpg']
            });

            bind_click_to_link("mania", {
                projName: 'RHYTHM MANIA: MUSIC GAME', 
                projDesc: 'A rhythm game for anroid with 10 000+ installs and online highscore tables', 
                projLink: 'https://play.google.com/store/apps/details?id=com.fataliti.rhythm&hl=ru&gl=US', 
                projPics: ['maniagif.gif']
            });

            bind_click_to_link("direct", {
                projName: 'FATALNY DIRECT', 
                projDesc: 'Standalone osu! beatmap downloader with Tillerino and PPaddict integration', 
                projLink: 'https://fataliti.itch.io/fatalny-direct', 
                projPics: ['direct.jpg']
            });

            bind_click_to_link("katana", {
                projName: 'KATANA REVERS', 
                projDesc: 'A small game for a gamejam with time manipulations', 
                projLink: 'https://fataliti.itch.io/katana-revers', 
                projPics: ['katana.gif']
            });

            bind_click_to_link("kobeni", {
                projName: 'CHAINSAW DANCE', 
                projDesc: 'A small rhythm fan game about dancing Kobeni', 
                projLink: 'https://benedique.itch.io/chainsaw-dance', 
                projPics: ['kobeni1.gif', 'kobeni2.gif']
            });

            bind_click_to_link("gunvein", {
                projName: 'GUNVEIN', 
                projDesc: 'Bullethell shoot em up game', 
                projLink: 'https://store.steampowered.com/app/2025840/Gunvein/',
                projPics: ['gunvein1.gif','gunvein2.gif']
            });

            bind_click_to_link("lucido", {
                projName: 'LUCIDO CANCELS EVERYTHING', 
                projDesc: 'Psychedelic Beat \'Em Up', 
                projLink: 'https://store.steampowered.com/app/2898730/LUCIDO_Cancels_Everything/',
                projPics: ['lucido_guf_2.webp']
            });

            bind_click_to_link("norland", {
                projName: 'NORLAND', 
                projDesc: 'Norland is a medieval kingdom sim inspired by Rimworld, Crusader Kings, and Caesar that generates complex stories.', 
                projLink: 'https://store.steampowered.com/app/1857090/Norland/',
                projPics: ['norland.gif']
            });

            document.getElementById('norland').onclick();

            document.getElementById("extend").onclick = () -> {
                var otherProjDiv = document.getElementById("otherproj");
            
                var addSideProject = (p:AnotherProject) -> {
                    var div = document.createElement('div');
                    div.className = 'column';
                    var a = document.createElement('a');
                    a.className = 'proj';
                    a.id = "id_" + p.projName;

                    div.appendChild(a);
                    var img = document.createImageElement();
                    img.className = 'projico';
                    img.src = p.projIco;
                    a.appendChild(img);

                    otherProjDiv.appendChild(div);
                    bind_click_to_link(a.id, p);
                }

                var sideprojects:Array<AnotherProject> = [
                    {
                        projIco: 'src/img/castoff.png', 
                        projName: 'CASTOFF', 
                        projDesc: 'A small jam games about mages', 
                        projLink: 'https://fataliti.itch.io/cast-off', 
                        projPics: ['src/img/castoff2.gif']
                    },
                    {
                        projIco: 'src/img/rgdbot.webp',
                        projName: 'RGD BOT',
                        projDesc: 'Russian Gamedev Server\'s discord bot made with HAXE',
                        projLink: 'https://github.com/fataliti/RgdBot',
                    }, 
                    {
                        projIco: 'src/img/podsosbot.webp',
                        projName: 'PODSOS BOT',
                        projDesc: 'Multiserver discord bot which posts pictures from some booru resourses, also made with HAXE',
                        projLink: 'https://github.com/fataliti/Fatalny-podsos',
                    },
                    {
                        projIco: 'src/img/gmedit.png',
                        projName: 'GMEDIT DISCORD RPC PLUGIN',
                        projDesc: 'The plugin will show your status in Discord',
                        projLink: 'https://github.com/fataliti/GMEdit-Discord-RPC',
                        projPics: ['src/img/demo.png']
                    },
                    {
                        projIco: 'src/img/GMV.png',
                        projName: 'GM VIDEO',
                        projDesc: 'An extension for Game Maker Studio 2 which allow to play videos',
                        projLink: 'https://fataliti.itch.io/gmvideo',
                        projPics: ['src/img/video.png']
                    },
                    {
                        projIco: 'src/img/ShB.png',
                        projName: 'SHADER BRUH',
                        projDesc: 'A tool which allow to make shaders for ame Maker Studio 2 with graphic node editor',
                        projLink: 'https://fataliti.itch.io/shaderbruh',
                        projPics: ['src/img/shader.png']
                    },
                    {
                        projIco: 'src/img/orcico.png',
                        projName: 'ORCS\'S FATE',
                        projDesc: 'One of my first games, russian visual novel about orc',
                        projLink: 'https://fataliti.pro/orc/orc.html',
                        projPics: ['src/img/orcimg.png']
                    },
                    {
                        projIco: 'src/img/evoico.png',
                        projName: 'EVO',
                        projDesc: 'Another one jam game about evolution',
                        projLink: 'https://fataliti.pro/evo/evonext.html',
                        projPics: ['src/img/evogif.gif']
                    },

                ];

                if (is_extended) {
                    return;
                }

                for (s in sideprojects) {
                    addSideProject(s);
                }

                is_extended = true;
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


