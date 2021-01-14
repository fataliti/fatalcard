
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

            var setDesc = (proj:String, desc:String, imgs:Array<String>, link:String = '') -> {
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
                par.setAttribute('style', 'text-align: center; font-size: 20px; width: 500px; display: flex; margin: auto;');
                

                var screenDiv = document.createElement('div');
                screenDiv.className = 'tab';
                screenDiv.setAttribute('style', 'padding-top: 10px;');
                
                for (s in imgs) {
                    var _img = document.createElement('img');
                    _img.className = 'screens';
                    _img.setAttribute('src', s);
                    screenDiv.appendChild(_img);
                }

                rootDiv.appendChild(_link);
                rootDiv.appendChild(par);
                rootDiv.appendChild(screenDiv);
                divDesc.appendChild(rootDiv);

                
                var t = new haxe.Timer(5);
                t.run = function () {
                    window.scrollTo(0, document.body.scrollHeight);
                    t.stop();
                }
                
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

        }
    }



}

