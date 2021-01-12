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
            
        }
    }

}

