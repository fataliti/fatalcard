// Generated by Haxe 4.1.5
(function ($global) { "use strict";
var Main = function() { };
Main.main = function() {
	window.onload = function() {
		var _g = 0;
		var _g1 = window.document.getElementsByClassName("imglink");
		while(_g < _g1.length) {
			var element = [_g1[_g]];
			++_g;
			element[0].onmouseover = (function(element) {
				return function() {
					element[0].className = "overed";
				};
			})(element);
			element[0].onmouseout = (function(element) {
				return function() {
					element[0].className = "imglink";
				};
			})(element);
		}
		var _g = 0;
		var _g1 = window.document.getElementsByClassName("projico");
		while(_g < _g1.length) {
			var element1 = [_g1[_g]];
			++_g;
			element1[0].onmouseover = (function(element) {
				return function() {
					element[0].className = "projicoact";
				};
			})(element1);
			element1[0].onmouseout = (function(element) {
				return function() {
					element[0].className = "projico";
				};
			})(element1);
		}
		var divDesc = window.document.getElementById("description");
		var setDesc = function(proj,desc,imgs,link) {
			if(link == null) {
				link = "";
			}
			if(divDesc.firstElementChild != null) {
				divDesc.firstElementChild.remove();
			}
			var rootDiv = window.document.createElement("div");
			var _link = window.document.createElement("a");
			_link.setAttribute("href",link);
			_link.setAttribute("target","_blank");
			_link.setAttribute("style","color: #000000;");
			var h4 = window.document.createElement("h4");
			h4.textContent = proj;
			h4.className = "name";
			h4.setAttribute("style","text-align: center; font-size: 20px;");
			_link.appendChild(h4);
			var par = window.document.createElement("p");
			par.textContent = desc;
			par.className = "name";
			par.setAttribute("style","text-align: center; font-size: 20px; width: 500px; display: flex; margin: auto;");
			var screenDiv = window.document.createElement("div");
			screenDiv.className = "tab";
			screenDiv.setAttribute("style","padding-top: 10px;");
			var _g = 0;
			while(_g < imgs.length) {
				var s = imgs[_g];
				++_g;
				var _img = window.document.createElement("img");
				_img.className = "screens";
				_img.setAttribute("src",s);
				screenDiv.appendChild(_img);
			}
			rootDiv.appendChild(_link);
			rootDiv.appendChild(par);
			rootDiv.appendChild(screenDiv);
			divDesc.appendChild(rootDiv);
			var t = new haxe_Timer(5);
			return t.run = function() {
				window.scrollTo(0,window.document.body.scrollHeight);
				t.stop();
			};
		};
		window.document.getElementById("sentinel").onclick = function() {
			setDesc("TERMINAL SQUAD: SENTINEL","Terminal Squad: Sentinel represents a mixture of different genres, where the player must destroy the waves of enemies as a mech pilot, using the field match3 for charging of assault and protective equipment. The power of enemies and the award for their elimination grow with the progression of levels.",["sent1.jpg","sent2.jpg"],"https://store.steampowered.com/app/1118050/Terminal_squad_Sentinel/");
		};
		window.document.getElementById("swarmites").onclick = function() {
			setDesc("TERMINAL SQUAD: SWARMITES","Terminal squad: swarmites is a game with indirect control where you must erect a chain of buildings, which generate resources for construction or the combat units for destruction of an enemy.",["swarm1.jpg","swarm2.jpg"],"https://store.steampowered.com/app/1217330/Terminal_squad_Swarmites/");
		};
		window.document.getElementById("space").onclick = function() {
			setDesc("DEEP SPACE SHOOTER","The first game of mine which was published on Steam",["space1.jpg","space2.jpg"],"https://store.steampowered.com/app/972280/Deep_Space_Shooter/");
		};
		window.document.getElementById("mania").onclick = function() {
			setDesc("RHYTHM MANIA: MUSIC GAME","A rhythm game for anroid with 10 000+ installs and online highscore tables",["maniagif.gif"],"https://play.google.com/store/apps/details?id=com.fataliti.rhythm&hl=ru&gl=US");
		};
		window.document.getElementById("direct").onclick = function() {
			setDesc("FATALNY DIRECT","Standalone osu! beatmap downloader with Tillerino and PPaddict integration",["direct.jpg"],"https://fataliti.itch.io/fatalny-direct");
		};
		window.document.getElementById("katana").onclick = function() {
			setDesc("KATANA REVERS","A small game for a gamejam with time manipulations",["katana.gif"],"https://fataliti.itch.io/katana-revers");
		};
	};
};
var haxe_Timer = function(time_ms) {
	var me = this;
	this.id = setInterval(function() {
		me.run();
	},time_ms);
};
haxe_Timer.prototype = {
	stop: function() {
		if(this.id == null) {
			return;
		}
		clearInterval(this.id);
		this.id = null;
	}
	,run: function() {
	}
};
var haxe_iterators_ArrayIterator = function(array) {
	this.current = 0;
	this.array = array;
};
haxe_iterators_ArrayIterator.prototype = {
	hasNext: function() {
		return this.current < this.array.length;
	}
	,next: function() {
		return this.array[this.current++];
	}
};
Main.main();
})({});
