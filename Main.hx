
import js.html.Console;
import js.Browser.document;
import js.Browser.window;

class Main {

    static function main() {
        window.onload = function() {

            for (element in document.getElementsByClassName('imglink')) {
                element.onmouseover = function () {
                    element.className = 'overed';
                }
                element.onmouseout = function () {
                    element.className = 'imglink';
                }
            }
            
            for (element in document.getElementsByClassName('projico')) {
                element.onmouseover = function () {
                    element.className = 'projicoact';
                }
                element.onmouseout = function () {
                    element.className = 'projico';
                }
            }

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
                h4.setAttribute('style', 'text-align: center; font-size: 20px;');

                _link.appendChild(h4);

                var par = document.createElement('p');
                par.textContent = desc;
                par.className = 'name';
                par.setAttribute('style', 'text-align: center; font-size: 20px; width: 500px;  margin: auto; font-weight: 600;');
                

                var screenDiv = document.createElement('div');
                screenDiv.className = 'tab';
                screenDiv.setAttribute('style', 'padding-top: 10px;');
                
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

            document.getElementById('sentinel').onclick = function()  { setDesc(
                'TERMINAL SQUAD: SENTINEL',
                'Terminal Squad: Sentinel represents a mixture of different genres, where the player must destroy the waves of enemies as a mech pilot, using the field match3 for charging of assault and protective equipment. The power of enemies and the award for their elimination grow with the progression of levels.',
                ['sent1.jpg', 'sent2.jpg'],
                'https://store.steampowered.com/app/1118050/Terminal_squad_Sentinel/'
                );
            }

            document.getElementById('swarmites').onclick = function()  { setDesc(
                'TERMINAL SQUAD: SWARMITES',
                'Terminal squad: swarmites is a game with indirect control where you must erect a chain of buildings, which generate resources for construction or the combat units for destruction of an enemy.',
                ['swarm1.jpg', 'swarm2.jpg'],
                'https://store.steampowered.com/app/1217330/Terminal_squad_Swarmites/'
                );
            }

            document.getElementById('space').onclick = function () { setDesc(
                'DEEP SPACE SHOOTER',
                'The first game of mine which was published on Steam',
                ['space1.jpg', 'space2.jpg'],
                'https://store.steampowered.com/app/972280/Deep_Space_Shooter/'
                );
            }

            document.getElementById('mania').onclick = function () { setDesc(
                'RHYTHM MANIA: MUSIC GAME',
                'A rhythm game for anroid with 10 000+ installs and online highscore tables',
                ['maniagif.gif'],
                'https://play.google.com/store/apps/details?id=com.fataliti.rhythm&hl=ru&gl=US'
                );
            }

            document.getElementById('direct').onclick = function () { setDesc(
                'FATALNY DIRECT',
                'Standalone osu! beatmap downloader with Tillerino and PPaddict integration',
                ['direct.jpg'],
                'https://fataliti.itch.io/fatalny-direct'
                );
            }
            document.getElementById('katana').onclick = function () { setDesc(
                'KATANA REVERS',
                'A small game for a gamejam with time manipulations',
                ['katana.gif'],
                'https://fataliti.itch.io/katana-revers'
                );
            }

            document.getElementById('kobeni').onclick = function () { setDesc(
                'CHAINSAW DANCE',
                'A small rhythm fan game about dancing Kobeni',
                ['kobeni1.gif', 'kobeni2.gif'],
                'https://benedique.itch.io/chainsaw-dance'
                );
            }

            document.getElementById("extend").onclick = () -> {
                var otherProjDiv = document.getElementById("otherproj");
            
                var addSideProject = (p:AnotherProject) -> {
                    var div = document.createElement('div');
                    div.className = 'column';
                    var a = document.createElement('a');
                    a.className = 'proj';
                    a.onclick = () -> {
                        setDesc(p.projName, p.projDesc, p.projPics, p.projLink);
                    }

                    div.appendChild(a);
                    var img = document.createImageElement();
                    img.className = 'projico';
                    img.src = p.projIco;
                    a.appendChild(img);
                    img.onmouseover = function () {
                        img.className = 'projicoact';
                    }
                    img.onmouseout = function () {
                        img.className = 'projico';
                    }
                    otherProjDiv.appendChild(div);
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

                for (s in sideprojects) {
                    addSideProject(s);
                }
            }

        }
    }

}


typedef AnotherProject = {
    projIco:String,
    projName:String,
    projDesc:String,
    projLink:String,
    ?projPics:Array<String>,
}


