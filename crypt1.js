var MooTools={
	version:"1.2.5",
	build:"008d8f0f2fcc2044e54fdd3635341aaab274e757"
};
var Native=function(m){
	m=m||{};
	var a=m.name;
	var k=m.legacy;
	var b=m.protect;
	var c=m.implement;
	var j=m.generics;
	var g=m.initialize;
	var h=m.afterImplement||function(){};
	var d=g||k;
	j=j!==false;
	d.constructor=Native;
	d.$family={
		name:"native"
	};
	if(k&&g){
		d.prototype=k.prototype
	}
	d.prototype.constructor=d;
	if(a){
		var f=a.toLowerCase();
		d.prototype.$family={name:f};
		Native.typize(d,f)
	}
	var l=function(q,n,r,o){
		if(!b||o||!q.prototype[n]){
			q.prototype[n]=r
		}
		if(j){
			Native.genericize(q,n,b)
		}
		h.call(q,n,r);
		return q
	};
	d.alias=function(q,n,s){
		if(typeof q=="string"){
			var r=this.prototype[q];
			if((q=r)){
				return l(this,n,q,s)
			}
		}
		for(var o in q){
			this.alias(o,q[o],n)
		}
	return this};
	d.implement=function(o,n,r){
		if(typeof o=="string"){
			return l(this,o,n,r)
		}
		for(var q in o){
			l(this,q,o[q],n)
		}
	return this};
	if(c){
		d.implement(c)
	}
return d};
Native.genericize=function(b,c,a){
	if((!a||!b[c])&&typeof b.prototype[c]=="function"){
		b[c]=function(){
			var d=Array.prototype.slice.call(arguments);
			return b.prototype[c].apply(d.shift(),d)
		}
	}
};
Native.implement=function(d,c){
	for(var b=0,a=d.length;b<a;b++){
		d[b].implement(c)
	}
};
Native.typize=function(a,b){
	if(!a.type){
		a.type=function(c){
			return($type(c)===b)
		}
	}
};(function(){
	var a={Array:Array,Date:Date,Function:Function,Number:Number,RegExp:RegExp,String:String};
	for(var j in a){
		new Native({
			name:j,initialize:a[j],protect:true
		})
	}
	var d={"boolean":Boolean,"native":Native,object:Object};
	for(var c in d){
		Native.typize(d[c],c)
	}
	var h={Array:["concat","indexOf","join","lastIndexOf","pop","push","reverse","shift","slice","sort","splice","toString","unshift","valueOf"],String:["charAt","charCodeAt","concat","indexOf","lastIndexOf","match","replace","search","slice","split","substr","substring","toLowerCase","toUpperCase","valueOf"]};
	for(var f in h){
		for(var b=h[f].length;b--;){
			Native.genericize(a[f],h[f][b],true)
		}
	}
})();
var Hash=new Native({
	name:"Hash",
	initialize:function(a){
		if($type(a)=="hash"){
			a=$unlink(a.getClean())
		}
		for(var b in a){
			this[b]=a[b]
		}return this
	}
});
Hash.implement({
	forEach:function(b,c){
		for(var a in this){
			if(this.hasOwnProperty(a)){
				b.call(c,this[a],a,this)
			}
		}
	},
	getClean:function(){
		var b={};
		for(var a in this){
			if(this.hasOwnProperty(a)){
				b[a]=this[a]
			}
		}
	return b},
	getLength:function(){
		var b=0;
		for(var a in this){
			if(this.hasOwnProperty(a)){
				b++
			}
		}return b
	}
});
Hash.alias("forEach","each");
Array.implement({
	forEach:function(c,d){
		for(var b=0,a=this.length;b<a;b++){
			c.call(d,this[b],b,this)
		}
	}
});
Array.alias("forEach","each");
function $A(b){
	if(b.item){
		var a=b.length,c=new Array(a);
		while(a--){
			c[a]=b[a]
		}return c
	}return Array.prototype.slice.call(b)
}
function $arguments(a){
	return function(){
		return arguments[a]
	}
}
function $chk(a){
	return !!(a||a===0)
}
function $clear(a){
	clearTimeout(a);
	clearInterval(a);
	return null
}
function $defined(a){
	return(a!=undefined)
}
function $each(c,b,d){
	var a=$type(c);
	((a=="arguments"||a=="collection"||a=="array")?Array:Hash).each(c,b,d)
}
function $empty(){}
function $extend(c,a){
	for(var b in (a||{})){
		c[b]=a[b]
	}return c
}
function $H(a){
	return new Hash(a)
}
function $lambda(a){
	return($type(a)=="function")?a:function(){
		return a
	}
}
function $merge(){
	var a=Array.slice(arguments);
	a.unshift({});
	return $mixin.apply(null,a)
}
function $mixin(f){
	for(var d=1,a=arguments.length;d<a;d++){
		var b=arguments[d];
		if($type(b)!="object"){continue}
		for(var c in b){
			var h=b[c],g=f[c];
			f[c]=(g&&$type(h)=="object"&&$type(g)=="object")?$mixin(g,h):$unlink(h)
		}
	}return f
}
function $pick(){
	for(var b=0,a=arguments.length;b<a;b++){
		if(arguments[b]!=undefined){
			return arguments[b]
		}
	}return null
}
function $random(b,a){
	return Math.floor(Math.random()*(a-b+1)+b)
}
function $splat(b){
	var a=$type(b);
	return(a)?((a!="array"&&a!="arguments")?[b]:b):[]
}
var $time=Date.now||function(){
	return +new Date
};
function $try(){
	for(var b=0,a=arguments.length;b<a;b++){
		try{
			return arguments[b]()
		}
		catch(c){}
	}
	return null
}
function $type(a){
	if(a==undefined){return false}
	if(a.$family){return(a.$family.name=="number"&&!isFinite(a))?false:a.$family.name}
	if(a.nodeName){
		switch(a.nodeType){
			case 1:return"element";
			case 3:return(/\S/).test(a.nodeValue)?"textnode":"whitespace"
		}
	}else{
		if(typeof a.length=="number"){
			if(a.callee){
				return"arguments"
			}else{
				if(a.item){
					return"collection"
				}
			}
		}
	}
	return typeof a
}
function $unlink(c){
	var b;
	switch($type(c)){
		case"object":b={};
		for(var f in c){
			b[f]=$unlink(c[f])
		}
		break;
		case"hash":b=new Hash(c);
		break;
		case"array":b=[];
		for(var d=0,a=c.length;d<a;d++){
			b[d]=$unlink(c[d])
		}
		break;
		default:return c
	}
	return b
}
Array.implement({
	every:function(c,d){
		for(var b=0,a=this.length;b<a;b++){
			if(!c.call(d,this[b],b,this)){
				return false
			}
		}
		return true
	},
	filter:function(d,f){
		var c=[];
		for(var b=0,a=this.length;b<a;b++){
			if(d.call(f,this[b],b,this)){
				c.push(this[b])
			}
		}
		return c
	},
	clean:function(){
		return this.filter($defined)
	},
	indexOf:function(c,d){
		var a=this.length;
		for(var b=(d<0)?Math.max(0,a+d):d||0;b<a;b++){
			if(this[b]===c){return b}
		}
		return -1
	},
	map:function(d,f){
		var c=[];
		for(var b=0,a=this.length;b<a;b++){
			c[b]=d.call(f,this[b],b,this)
		}
		return c
	},
	some:function(c,d){
		for(var b=0,a=this.length;b<a;b++){
			if(c.call(d,this[b],b,this)){return true}
		}
		return false
	},
	associate:function(c){
		var d={},
		b=Math.min(this.length,c.length);
		for(var a=0;a<b;a++){
			d[c[a]]=this[a]
		}return d
	},
	link:function(c){
		var a={};
		for(var f=0,b=this.length;f<b;f++){
			for(var d in c){
				if(c[d](this[f])){
					a[d]=this[f];
					delete c[d];
					break
				}
			}
		}return a
	},
	contains:function(a,b){
		return this.indexOf(a,b)!=-1
	},
	extend:function(c){
		for(var b=0,a=c.length;b<a;b++){
			this.push(c[b])
		}return this
	},
	getLast:function(){
		return(this.length)?this[this.length-1]:null
	},
	getRandom:function(){
		return(this.length)?this[$random(0,this.length-1)]:null
		},
		include:function(a){
			if(!this.contains(a)){
				this.push(a)
			}return this
		},
		combine:function(c){
			for(var b=0,a=c.length;b<a;b++){
				this.include(c[b])
			}return this
		},
		erase:function(b){
			for(var a=this.length;a--;a){
				if(this[a]===b){
					this.splice(a,1)
				}
			}return this
		},
		empty:function(){
			this.length=0;
			return this
		},
		flatten:function(){
			var d=[];
			for(var b=0,a=this.length;b<a;b++){
				var c=$type(this[b]);
				if(!c){continue}
				d=d.concat((c=="array"||c=="collection"||c=="arguments")?Array.flatten(this[b]):this[b])
			}return d
		},
		hexToRgb:function(b){
			if(this.length!=3){
				return null
			}
			var a=this.map(function(c){
				if(c.length==1){c+=c}
				return c.toInt(16)
			});
			return(b)?a:"rgb("+a+")"
		},
		rgbToHex:function(d){
			if(this.length<3){return null}
			if(this.length==4&&this[3]==0&&!d){return"transparent"}
			var b=[];
			for(var a=0;a<3;a++){
				var c=(this[a]-0).toString(16);
				b.push((c.length==1)?"0"+c:c)
			}
			return(d)?b:"#"+b.join("")
		}
	});
	String.implement({
		test:function(a,b){
			return((typeof a=="string")?new RegExp(a,b):a).test(this)
		},
		contains:function(a,b){
			return(b)?(b+this+b).indexOf(b+a+b)>-1:this.indexOf(a)>-1
		},
		trim:function(){
			return this.replace(/^\s+|\s+$/g,"")
		},
		clean:function(){
			return this.replace(/\s+/g," ").trim()
		},
		camelCase:function(){
			return this.replace(/-\D/g,function(a){
				return a.charAt(1).toUpperCase()
			})
		},
		hyphenate:function(){
			return this.replace(/[A-Z]/g,function(a){
				return("-"+a.charAt(0).toLowerCase())
			})
		},
		capitalize:function(){
			return this.replace(/\b[a-z]/g,function(a){
				return a.toUpperCase()
			})
		},
		escapeRegExp:function(){
			return this.replace(/([-.*+?^${}()|[\]\/\\])/g,"\\$1")
		},
		toInt:function(a){
			return parseInt(this,a||10)
		},
		toFloat:function(){
			return parseFloat(this)
		},
		hexToRgb:function(b){
			var a=this.match(/^#?(\w{1,2})(\w{1,2})(\w{1,2})$/);
			return(a)?a.slice(1).hexToRgb(b):null
		},
		rgbToHex:function(b){
			var a=this.match(/\d{1,3}/g);
			return(a)?a.rgbToHex(b):null
		},
		stripScripts:function(b){
			var a="";
			var c=this.replace(/<script[^>]*>([\s\S]*?)<\/script>/gi,function(){
				a+=arguments[1]+"\n";
				return""
			});
			if(b===true){
				$exec(a)
			}else{
				if($type(b)=="function"){
					b(a,c)
				}
			}return c
		},
		substitute:function(a,b){
			return this.replace(b||(/\\?\{([^{}]+)\}/g),
				function(d,c){
					if(d.charAt(0)=="\\"){
						return d.slice(1)
					}return(a[c]!=undefined)?a[c]:""
				})
			}
		});
	try{
		delete Function.prototype.bind
	}
	catch(e){}
	
	
	Function.implement({
		extend:function(a){
			for(var b in a){
				this[b]=a[b]
			}
			return this
		},
		create:function(b){
			var a=this;
			b=b||{};
			return function(d){
				var c=b.arguments;
				c=(c!=undefined)?$splat(c):Array.slice(arguments,(b.event)?1:0);
				if(b.event){
					c=[d||window.event].extend(c)
				}
				var f=function(){
					return a.apply(b.bind||null,c)
				};
				if(b.delay){
					return setTimeout(f,b.delay)
				}
				if(b.periodical){
					return setInterval(f,b.periodical)
				}
				if(b.attempt){
					return $try(f)
				}
				return f()
			}
		},
		run:function(a,b){
			return this.apply(b,$splat(a))
		},
		pass:function(a,b){
			return this.create({
				bind:b,
				arguments:a
			})
		},
		bind:function(b,a){
			return this.create({
				bind:b,
				arguments:a
			})
		},
		bindWithEvent:function(b,a){
			return this.create({
				bind:b,
				arguments:a,
				event:true
			})
		},
		attempt:function(a,b){
			return this.create({
				bind:b,
				arguments:a,
				attempt:true
			})()
		},
		delay:function(b,c,a){
			return this.create({
				bind:c,
				arguments:a,
				delay:b
			})()
		},
		periodical:function(c,b,a){
			return this.create({
				bind:b,
				arguments:a,
				periodical:c
			})()
		}
	});
	Number.implement({
		limit:function(b,a){
			return Math.min(a,Math.max(b,this))
		},
		round:function(a){
			a=Math.pow(10,a||0);
			return Math.round(this*a)/a
		},
		times:function(b,c){
			for(var a=0;a<this;a++){
				b.call(c,a,this)
			}
		},
		toFloat:function(){
			return parseFloat(this)
		},
		toInt:function(a){
			return parseInt(this,a||10)
		}
	});
	Number.alias("times","each");
	(function(b){
		var a={};
		b.each(function(c){
			if(!Number[c]){
				a[c]=function(){
					return Math[c].apply(null,[this].concat($A(arguments)))
				}
			}
		});
		Number.implement(a)
	})(["abs","acos","asin","atan","atan2","ceil","cos","exp","floor","log","max","min","pow","sin","sqrt","tan"]);
	Hash.implement({
		has:Object.prototype.hasOwnProperty,
		keyOf:function(b){
			for(var a in this){
				if(this.hasOwnProperty(a)&&this[a]===b){return a}
			}
			return null
		},
		hasValue:function(a){
			return(Hash.keyOf(this,a)!==null)
		},
		extend:function(a){
			Hash.each(a||{},function(c,b){
				Hash.set(this,b,c)
			},this);
			return this
		},
		combine:function(a){
			Hash.each(a||{},function(c,b){
				Hash.include(this,b,c)
			},this);
			return this
		},
		erase:function(a){
			if(this.hasOwnProperty(a)){
				delete this[a]
			}
			return this
		},
		get:function(a){
			return(this.hasOwnProperty(a))?this[a]:null
		},
		set:function(a,b){
			if(!this[a]||this.hasOwnProperty(a)){
				this[a]=b
			}
			return this
		},
		empty:function(){
			Hash.each(this,function(b,a){
				delete this[a]
			},this);
			return this
		},
		include:function(a,b){
			if(this[a]==undefined){
				this[a]=b
			}
			return this
		},
		map:function(b,c){
			var a=new Hash;
			Hash.each(this,function(f,d){
				a.set(d,b.call(c,f,d,this))
			},this);
			return a
		},
		filter:function(b,c){
			var a=new Hash;
			Hash.each(this,function(f,d){
				if(b.call(c,f,d,this)){
					a.set(d,f)
				}
			},this);
			return a
		},
		every:function(b,c){
			for(var a in this){
				if(this.hasOwnProperty(a)&&!b.call(c,this[a],a)){return false}
			}
			return true
		},
		some:function(b,c){
			for(var a in this){
				if(this.hasOwnProperty(a)&&b.call(c,this[a],a)){return true}
			}
			return false
		},
		getKeys:function(){
			var a=[];
			Hash.each(this,function(c,b){
				a.push(b)
			});
			return a
		},
		getValues:function(){
			var a=[];
			Hash.each(this,function(b){
				a.push(b)
			});
			return a
		},
		toQueryString:function(a){
			var b=[];
			Hash.each(this,function(g,f){
				if(a){
					f=a+"["+f+"]"
				}
				var d;
				switch($type(g)){
					case"object":d=Hash.toQueryString(g,f);
					break;
					case"array":var c={};
					g.each(function(j,h){
						c[h]=j
					});
					d=Hash.toQueryString(c,f);
					break;
					default:d=f+"="+encodeURIComponent(g)
				}
				if(g!=undefined){
					b.push(d)
				}
			});
			return b.join("&")
		}
	});
	Hash.alias({
		keyOf:"indexOf",
		hasValue:"contains"
	});
	function Class(b){
		if(b instanceof Function){
			b={
				initialize:b
			}
		}
		var a=function(){
			Object.reset(this);
			if(a._prototyping){
				return this
			}
			this._current=$empty;
			var c=(this.initialize)?this.initialize.apply(this,arguments):this;
			delete this._current;
			delete this.caller;return c
		}.extend(this);
		a.implement(b);
		a.constructor=Class;
		a.prototype.constructor=a;
		return a
	}
	Function.prototype.protect=function(){
		this._protected=true;
		return this
	};
	Object.reset=function(a,c){
		if(c==null){
			for(var f in a){
				Object.reset(a,f)
			}return a
		}
		delete a[c];
		switch($type(a[c])){
			case"object":var d=function(){};
			d.prototype=a[c];
			var b=new d;
			a[c]=Object.reset(b);
			break;
			case"array":a[c]=$unlink(a[c]);
			break
		}return a
	};
	new Native({
		name:"Class",
		initialize:Class
	}).extend({
		instantiate:function(b){
			b._prototyping=true;
			var a=new b;
			delete b._prototyping;
			return a
		},
		wrap:function(a,b,c){
			if(c._origin){
				c=c._origin
			}
			return function(){
				if(c._protected&&this._current==null){
					throw new Error('The method "'+b+'" cannot be called.')
				}
				var f=this.caller,
				g=this._current;
				this.caller=g;
				this._current=arguments.callee;
				var d=c.apply(this,arguments);
				this._current=g;
				this.caller=f;
				return d
			}.extend({_owner:a,_origin:c,_name:b})
		}
	});
	Class.implement({
		implement:function(a,d){
			if($type(a)=="object"){
				for(var f in a){
					this.implement(f,a[f])
				}return this
			}
			var g=Class.Mutators[a];
			if(g){
				d=g.call(this,d);
				if(d==null){return this}
			}
			var c=this.prototype;
			switch($type(d)){
				case"function":if(d._hidden){return this}
				c[a]=Class.wrap(this,a,d);
				break;
				case"object":var b=c[a];
				if($type(b)=="object"){
					$mixin(b,d)
				}else{
					c[a]=$unlink(d)
				}
				break;
				case"array":c[a]=$unlink(d);
				break;
				default:c[a]=d
			}return this
		}
	});
	Class.Mutators={
		Extends:function(a){
			this.parent=a;
			this.prototype=Class.instantiate(a);
			this.implement("parent",function(){
				var b=this.caller._name,
				c=this.caller._owner.parent.prototype[b];
				if(!c){
					throw new Error('The method "'+b+'" has no parent.')
				}
				return c.apply(this,arguments)
			}.protect())
		},
		Implements:function(a){
			$splat(a).each(function(b){
				if(b instanceof Function){
					b=Class.instantiate(b)
				}
				this.implement(b)
			},
			this)
		}
	};
	var Chain=new Class({
		$chain:[],
		chain:function(){
			this.$chain.extend(Array.flatten(arguments));
			return this
		},
		callChain:function(){
			return(this.$chain.length)?this.$chain.shift().apply(this,arguments):false
		},
		clearChain:function(){
			this.$chain.empty();
			return this
		}
	});
	var Events=new Class({
		$events:{},
		addEvent:function(c,b,a){
			c=Events.removeOn(c);
			if(b!=$empty){
				this.$events[c]=this.$events[c]||[];
				this.$events[c].include(b);
				if(a){
					b.internal=true
				}
			}return this
		},
		addEvents:function(a){
			for(var b in a){
				this.addEvent(b,a[b])
			}return this
		},
		fireEvent:function(c,b,a){
			c=Events.removeOn(c);
			if(!this.$events||!this.$events[c]){
				return this
			}
			this.$events[c].each(function(d){
				d.create({
					bind:this,
					delay:a,"arguments":b
				})()
			},this);
			return this
		},
		removeEvent:function(b,a){
			b=Events.removeOn(b);
			if(!this.$events[b]){
				return this
			}
			if(!a.internal){
				this.$events[b].erase(a)
			}return this
		},
		removeEvents:function(c){
			var d;
			if($type(c)=="object"){
				for(d in c){
					this.removeEvent(d,c[d])
				}return this
			}
			if(c){
				c=Events.removeOn(c)
			}
			for(d in this.$events){
				if(c&&c!=d){continue}
				var b=this.$events[d];
				for(var a=b.length;a--;a){
					this.removeEvent(d,b[a])
				}
			}return this
		}
	});
	Events.removeOn=function(a){
		return a.replace(/^on([A-Z])/,function(b,c){
			return c.toLowerCase()
		})
	};
	var Options=new Class({
		setOptions:function(){
			this.options=$merge.run([this.options].extend(arguments));
			if(!this.addEvent){return this}
			for(var a in this.options){
				if($type(this.options[a])!="function"||!(/^on[A-Z]/).test(a)){continue}
				this.addEvent(a,this.options[a]);
				delete this.options[a]
			}return this
		}
	});
	var Browser=$merge({
		Engine:{
			name:"unknown",
			version:0
		},
		Platform:{
			name:(window.orientation!=undefined)?"ipod":(navigator.platform.match(/mac|win|linux/i)||["other"])[0].toLowerCase()},
			Features:{
				xpath:!!(document.evaluate),
				air:!!(window.runtime),
				query:!!(document.querySelector)
			},
			Plugins:{},
			Engines:{
				presto:function(){
					return(!window.opera)?false:((arguments.callee.caller)?960:((document.getElementsByClassName)?950:925))
				},
				trident:function(){
					return(!window.ActiveXObject)?false:((window.XMLHttpRequest)?((document.querySelectorAll)?6:5):4)
				},
				webkit:function(){
					return(navigator.taintEnabled)?false:((Browser.Features.xpath)?((Browser.Features.query)?525:420):419)
				},
				gecko:function(){
					return(!document.getBoxObjectFor&&window.mozInnerScreenX==null)?false:((document.getElementsByClassName)?19:18)
				}
			}
		},
		Browser||{});
	Browser.Platform[Browser.Platform.name]=true;
	Browser.detect=function(){
		for(var b in this.Engines){
			var a=this.Engines[b]();
			if(a){
				this.Engine={
					name:b,
					version:a
				};
				this.Engine[b]=this.Engine[b+a]=true;
				break
			}
		}
		return{name:b,version:a}
	};
	Browser.detect();
	Browser.Request=function(){
		return $try(function(){
			return new XMLHttpRequest()
		},
		function(){
			return new ActiveXObject("MSXML2.XMLHTTP")
		},
		function(){
			return new ActiveXObject("Microsoft.XMLHTTP")
		})
	};
	Browser.Features.xhr=!!(Browser.Request());
	Browser.Plugins.Flash=(function(){
		var a=($try(function(){
			return navigator.plugins["Shockwave Flash"].description
		},
		function(){
			return new ActiveXObject("ShockwaveFlash.ShockwaveFlash").GetVariable("$version")
		})||"0 r0").match(/\d+/g);
		return{version:parseInt(a[0]||0+"."+a[1],10)||0,build:parseInt(a[2],10)||0}
	})();
	function $exec(b){
		if(!b){return b}
		if(window.execScript){
			window.execScript(b)
		}else{
			var a=document.createElement("script");
			a.setAttribute("type","text/javascript");
			a[(Browser.Engine.webkit&&Browser.Engine.version<420)?"innerText":"text"]=b;
			document.head.appendChild(a);
			document.head.removeChild(a)
		}return b
	}
	Native.UID=1;
	var $uid=(Browser.Engine.trident)?function(a){
		return(a.uid||(a.uid=[Native.UID++]))[0]}:function(a){
			return a.uid||(a.uid=Native.UID++)
		};
		var Window=new Native({
			name:"Window",
			legacy:(Browser.Engine.trident)?null:window.Window,initialize:function(a){
				$uid(a);if(!a.Element){
					a.Element=$empty;
					if(Browser.Engine.webkit){
						a.document.createElement("iframe")
					}
					a.Element.prototype=(Browser.Engine.webkit)?window["[[DOMElement.prototype]]"]:{}
				}
				a.document.window=a;
				return $extend(a,Window.Prototype)
			},
			afterImplement:function(b,a){
				window[b]=Window.Prototype[b]=a
			}
		});
		Window.Prototype={
			$family:{name:"window"}
		};
		new Window(window);
		var Document=new Native({
			name:"Document",
			legacy:(Browser.Engine.trident)?null:window.Document,initialize:function(a){
				$uid(a);
				a.head=a.getElementsByTagName("head")[0];
				a.html=a.getElementsByTagName("html")[0];
				if(Browser.Engine.trident&&Browser.Engine.version<=4){
					$try(function(){
						a.execCommand("BackgroundImageCache",false,true)
					})
				}
				if(Browser.Engine.trident){
					a.window.attachEvent("onunload",function(){
						a.window.detachEvent("onunload",arguments.callee);
						a.head=a.html=a.window=null
					})
				}
				return $extend(a,Document.Prototype)
			},
			afterImplement:function(b,a){
				document[b]=Document.Prototype[b]=a
			}
		});
		Document.Prototype={
			$family:{name:"document"}
		};
		new Document(document);
		var Element=new Native({
			name:"Element",
			legacy:window.Element,
			initialize:function(a,b){
				var c=Element.Constructors.get(a);
				if(c){
					return c(b)
				}
				if(typeof a=="string"){
					return document.newElement(a,b)
				}
				return document.id(a).set(b)
			},
			afterImplement:function(a,b){
				Element.Prototype[a]=b;
				if(Array[a]){return}
				Elements.implement(a,function(){
					var c=[],h=true;
					for(var f=0,d=this.length;f<d;f++){
						var g=this[f][a].apply(this[f],arguments);
						c.push(g);
						if(h){
							h=($type(g)=="element")
						}
					}
					return(h)?new Elements(c):c
				})
			}
		});
		Element.Prototype={
			$family:{
				name:"element"
			}
		};
		Element.Constructors=new Hash;
		var IFrame=new Native({
			name:"IFrame",
			generics:false,
			initialize:function(){
				var g=Array.link(arguments,{
					properties:Object.type,iframe:$defined
				});
				var d=g.properties||{};
				var c=document.id(g.iframe);
				var f=d.onload||$empty;
				delete d.onload;
				d.id=d.name=$pick(d.id,d.name,c?(c.id||c.name):"IFrame_"+$time());
				c=new Element(c||"iframe",d);
				var b=function(){
					var h=$try(function(){
						return c.contentWindow.location.host
					});
					if(!h||h==window.location.host){
						var j=new Window(c.contentWindow);
						new Document(c.contentWindow.document);
						$extend(j.Element.prototype,Element.Prototype)
					}
					f.call(c.contentWindow,c.contentWindow.document)
				};
				var a=$try(function(){
					return c.contentWindow
				});
				((a&&a.document.body)||window.frames[d.id])?b():c.addListener("load",b);
				return c
			}
		});
		var Elements=new Native({
			initialize:function(g,b){
				b=$extend({
					ddup:true,
					cash:true
				},b);
				g=g||[];
				if(b.ddup||b.cash){
					var h={},f=[];
					for(var c=0,a=g.length;c<a;c++){
						var d=document.id(g[c],!b.cash);
						if(b.ddup){
							if(h[d.uid]){
								continue
							}
							h[d.uid]=true
						}
						if(d){
							f.push(d)
						}
					}
					g=f
				}
				return(b.cash)?$extend(g,this):g
			}
		});
		Elements.implement({
			filter:function(a,b){
				if(!a){
					return this
				}
				return new Elements(Array.filter(this,(typeof a=="string")?function(c){
					return c.match(a)
				}:a,b))
			}
		});
		(function(){
			var d;
			try{
				var a=document.createElement("<input name=x>");
				d=(a.name=="x")
			}
			catch(b){}
			var c=function(f){
				return(""+f).replace(/&/g,"&amp;").replace(/"/g,"&quot;")
			};
			Document.implement({
				newElement:function(f,g){
					if(g&&g.checked!=null){
						g.defaultChecked=g.checked
					}
					if(d&&g){
						f="<"+f;
						if(g.name){
							f+=' name="'+c(g.name)+'"'
						}
						if(g.type){
							f+=' type="'+c(g.type)+'"'
						}
						f+=">";
						delete g.name;
						delete g.type
					}
					return this.id(this.createElement(f)).set(g)
				},
				newTextNode:function(f){
					return this.createTextNode(f)
				},
				getDocument:function(){
					return this
				},
				getWindow:function(){
					return this.window
				},
				id:(function(){
					var f={
						string:function(j,h,g){
							j=g.getElementById(j);
							return(j)?f.element(j,h):null
						},
						element:function(g,k){
							$uid(g);
							if(!k&&!g.$family&&!(/^object|embed$/i).test(g.tagName)){
								var h=Element.Prototype;
								for(var j in h){
									g[j]=h[j]
								}
							}
							return g
						},
						object:function(h,j,g){
							if(h.toElement){
								return f.element(h.toElement(g),j)
							}
							return null
						}
					};
					f.textnode=f.whitespace=f.window=f.document=$arguments(0);
					return function(h,k,j){
						if(h&&h.$family&&h.uid){
							return h
						}
						var g=$type(h);
						return(f[g])?f[g](h,k,j||document):null
					}
				})()
			})
		})();
		if(window.$==null){
			Window.implement({
				$:function(a,b){
					return document.id(a,b,this.document)
				}
			})
		}
		Window.implement({
			$$:function(a){
				if(arguments.length==1&&typeof a=="string"){
					return this.document.getElements(a)
				}
				var g=[];
				var c=Array.flatten(arguments);
				for(var d=0,b=c.length;d<b;d++){
					var f=c[d];
					switch($type(f)){
						case"element":g.push(f);
						break;
						case"string":g.extend(this.document.getElements(f,true))
					}
				}
				return new Elements(g)
			},
			getDocument:function(){
				return this.document
			},
			getWindow:function(){
				return this
			}
		});
		Native.implement([Element,Document],{
			getElement:function(a,b){
				return document.id(this.getElements(a,true)[0]||null,b)
			},
			getElements:function(a,d){
				a=a.split(",");
				var c=[];
				var b=(a.length>1);
				a.each(function(f){
					var g=this.getElementsByTagName(f.trim());
					(b)?c.extend(g):c=g
				},
				this);
				return new Elements(c,{
					ddup:b,cash:!d
				})
			}
		});
		(function(){
			var j={},g={};
			var k={
				input:"checked",
				option:"selected",
				textarea:(Browser.Engine.webkit&&Browser.Engine.version<420)?"innerHTML":"value"
			};
			var c=function(n){
				return(g[n]||(g[n]={}))
			};
			var h=function(q,n){
				if(!q){
					return
				}
				var o=q.uid;
				if(n!==true){
					n=false
				}
				if(Browser.Engine.trident){
					if(q.clearAttributes){
						var s=n&&q.cloneNode(false);
						q.clearAttributes();
						if(s){
							q.mergeAttributes(s)
						}
					}else{
						if(q.removeEvents){
							q.removeEvents()
						}
					}
					if((/object/i).test(q.tagName)){
						for(var r in q){
							if(typeof q[r]=="function"){
								q[r]=$empty
							}
						}
						Element.dispose(q)
					}
				}
				if(!o){
					return
				}
				j[o]=g[o]=null
			};
			var d=function(){
				Hash.each(j,h);
				if(Browser.Engine.trident){
					$A(document.getElementsByTagName("object")).each(h)
				}
				if(window.CollectGarbage){
					CollectGarbage()
				}
				j=g=null
			};
			var l=function(q,n,v,o,s,u){
				var r=q[v||n];
				var t=[];
				while(r){
					if(r.nodeType==1&&(!o||Element.match(r,o))){
						if(!s){
							return document.id(r,u)
						}
						t.push(r)
					}
					r=r[n]
				}
				return(s)?new Elements(t,{
					ddup:false,cash:!u
				}):null
			};
			var f={
				html:"innerHTML","class":"className","for":"htmlFor",
				defaultValue:"defaultValue",
				text:(Browser.Engine.trident||(Browser.Engine.webkit&&Browser.Engine.version<420))?"innerText":"textContent"};
				var b=["compact","nowrap","ismap","declare","noshade","checked","disabled","readonly","multiple","selected","noresize","defer"];
				var m=["value","type","defaultValue","accessKey","cellPadding","cellSpacing","colSpan","frameBorder","maxLength","readOnly","rowSpan","tabIndex","useMap"];
				b=b.associate(b);
				Hash.extend(f,b);
				Hash.extend(f,m.associate(m.map(String.toLowerCase)));
				var a={
					before:function(o,n){
						if(n.parentNode){
							n.parentNode.insertBefore(o,n)
						}
					},
					after:function(o,n){
						if(!n.parentNode){
							return
						}
						var q=n.nextSibling;
						(q)?n.parentNode.insertBefore(o,q):n.parentNode.appendChild(o)
					},
					bottom:function(o,n){
						n.appendChild(o)
					},
					top:function(o,n){
						var q=n.firstChild;
						(q)?n.insertBefore(o,q):n.appendChild(o)
					}
				};
				a.inside=a.bottom;
				Hash.each(a,function(n,o){
					o=o.capitalize();
					Element.implement("inject"+o,function(q){
						n(this,document.id(q,true));
						return this
					});
					Element.implement("grab"+o,function(q){
						n(document.id(q,true),this);
						return this
					})
				});
				Element.implement({
					set:function(r,o){
						switch($type(r)){
							case"object":for(var q in r){
								this.set(q,r[q])
							}
							break;
							case"string":var n=Element.Properties.get(r);
							(n&&n.set)?n.set.apply(this,Array.slice(arguments,1)):this.setProperty(r,o)
						}
						return this
					},
					get:function(o){
						var n=Element.Properties.get(o);
						return(n&&n.get)?n.get.apply(this,Array.slice(arguments,1)):this.getProperty(o)
					},
					erase:function(o){
						var n=Element.Properties.get(o);
						(n&&n.erase)?n.erase.apply(this):this.removeProperty(o);
						return this
					},
					setProperty:function(o,q){
						var n=f[o];
						if(q==undefined){
							return this.removeProperty(o)
						}
						if(n&&b[o]){
							q=!!q
						}
						(n)?this[n]=q:this.setAttribute(o,""+q);
						return this
					},
					setProperties:function(n){
						for(var o in n){
							this.setProperty(o,n[o])
						}
						return this
					},
					getProperty:function(o){
						var n=f[o];
						var q=(n)?this[n]:this.getAttribute(o,2);
						return(b[o])?!!q:(n)?q:q||null
					},
					getProperties:function(){
						var n=$A(arguments);
						return n.map(this.getProperty,this).associate(n)
					},
					removeProperty:function(o){
						var n=f[o];
						(n)?this[n]=(n&&b[o])?false:"":this.removeAttribute(o);
						return this
					},
					removeProperties:function(){
						Array.each(arguments,this.removeProperty,this);
						return this
					},
					hasClass:function(n){
						return this.className.contains(n," ")
					},
					addClass:function(n){
						if(!this.hasClass(n)){
							this.className=(this.className+" "+n).clean()
						}
						return this
					},
					removeClass:function(n){
						this.className=this.className.replace(new RegExp("(^|\\s)"+n+"(?:\\s|$)"),"$1");
						return this
					},
					toggleClass:function(n){
						return this.hasClass(n)?this.removeClass(n):this.addClass(n)
					},
					adopt:function(){
						Array.flatten(arguments).each(function(n){
							n=document.id(n,true);
							if(n){
								this.appendChild(n)
							}
						},
						this);
						return this
					},
					appendText:function(o,n){
						return this.grab(this.getDocument().newTextNode(o),n)
					},
					grab:function(o,n){
						a[n||"bottom"](document.id(o,true),this);
						return this
					},
					inject:function(o,n){
						a[n||"bottom"](this,document.id(o,true));
						return this
					},
					replaces:function(n){
						n=document.id(n,true);
						n.parentNode.replaceChild(this,n);
						return this
					},
					wraps:function(o,n){
						o=document.id(o,true);
						return this.replaces(o).grab(o,n)
					},
					getPrevious:function(n,o){
						return l(this,"previousSibling",null,n,false,o)
					},
					getAllPrevious:function(n,o){
						return l(this,"previousSibling",null,n,true,o)
					},
					getNext:function(n,o){
						return l(this,"nextSibling",null,n,false,o)
					},
					getAllNext:function(n,o){
						return l(this,"nextSibling",null,n,true,o)
					},
					getFirst:function(n,o){
						return l(this,"nextSibling","firstChild",n,false,o)
					},
					getLast:function(n,o){
						return l(this,"previousSibling","lastChild",n,false,o)
					},
					getParent:function(n,o){
						return l(this,"parentNode",null,n,false,o)
					},
					getParents:function(n,o){
						return l(this,"parentNode",null,n,true,o)
					},
					getSiblings:function(n,o){
						return this.getParent().getChildren(n,o).erase(this)
					},
					getChildren:function(n,o){
						return l(this,"nextSibling","firstChild",n,true,o)
					},
					getWindow:function(){
						return this.ownerDocument.window
					},
					getDocument:function(){
						return this.ownerDocument
					},
					getElementById:function(r,q){
						var o=this.ownerDocument.getElementById(r);
						if(!o){
							return null
						}
						for(var n=o.parentNode;n!=this;n=n.parentNode){
							if(!n){
								return null
							}
						}
						return document.id(o,q)
					},
					getSelected:function(){
						return new Elements($A(this.options).filter(function(n){
							return n.selected
						}))
					},
					getComputedStyle:function(o){
						if(this.currentStyle){
							return this.currentStyle[o.camelCase()]
						}
						var n=this.getDocument().defaultView.getComputedStyle(this,null);
						return(n)?n.getPropertyValue([o.hyphenate()]):null
					},
					toQueryString:function(){
						var n=[];
						this.getElements("input, select, textarea",true).each(function(o){
							if(!o.name||o.disabled||o.type=="submit"||o.type=="reset"||o.type=="file"){
								return
							}
							var q=(o.tagName.toLowerCase()=="select")?Element.getSelected(o).map(function(r){
								return r.value
							}):((o.type=="radio"||o.type=="checkbox")&&!o.checked)?null:o.value;
							$splat(q).each(function(r){
								if(typeof r!="undefined"){
									n.push(o.name+"="+encodeURIComponent(r))
								}
							})
						});
						return n.join("&")
					},
					clone:function(r,n){
						r=r!==false;
						var u=this.cloneNode(r);
						var q=function(y,x){
							if(!n){
								y.removeAttribute("id")
							}
							if(Browser.Engine.trident){
								y.clearAttributes();
								y.mergeAttributes(x);
								y.removeAttribute("uid");
								if(y.options){
									var z=y.options,v=x.options;
									for(var w=z.length;w--;){
										z[w].selected=v[w].selected
									}
								}
							}
							var A=k[x.tagName.toLowerCase()];
							if(A&&x[A]){
								y[A]=x[A]
							}
						};
						if(r){
							var s=u.getElementsByTagName("*"),t=this.getElementsByTagName("*");
							for(var o=s.length;o--;){
								q(s[o],t[o])
							}
						}
						q(u,this);
						return document.id(u)
					},
					destroy:function(){
						Element.empty(this);
						Element.dispose(this);
						h(this,true);
						return null
					},
					empty:function(){
						$A(this.childNodes).each(function(n){
							Element.destroy(n)
						});
						return this
					},
					dispose:function(){
						return(this.parentNode)?this.parentNode.removeChild(this):this
					},
					hasChild:function(n){
						n=document.id(n,true);
						if(!n){
							return false
						}
						if(Browser.Engine.webkit&&Browser.Engine.version<420){
							return $A(this.getElementsByTagName(n.tagName)).contains(n)
						}
						return(this.contains)?(this!=n&&this.contains(n)):!!(this.compareDocumentPosition(n)&16)
					},
					match:function(n){
						return(!n||(n==this)||(Element.get(this,"tag")==n))
					}
				});
				Native.implement([Element,Window,Document],{
					addListener:function(r,q){
						if(r=="unload"){
							var n=q,o=this;
							q=function(){
								o.removeListener("unload",q);
								n()
							}
						}else{
							j[this.uid]=this
						}
						if(this.addEventListener){
							this.addEventListener(r,q,false)
						}else{
							this.attachEvent("on"+r,q)
						}
						return this
					},
					removeListener:function(o,n){
						if(this.removeEventListener){
							this.removeEventListener(o,n,false)
						}else{
							this.detachEvent("on"+o,n)
						}
						return this
					},
					retrieve:function(o,n){
						var r=c(this.uid),q=r[o];
						if(n!=undefined&&q==undefined){
							q=r[o]=n
						}
						return $pick(q)
					},
					store:function(o,n){
						var q=c(this.uid);
						q[o]=n;
						return this
					},
					eliminate:function(n){
						var o=c(this.uid);
						delete o[n];
						return this
					}
				});
				window.addListener("unload",d)
			})();
		Element.Properties=new Hash;
		Element.Properties.style={
			set:function(a){
				this.style.cssText=a
			},
			get:function(){
				return this.style.cssText
			},
			erase:function(){
				this.style.cssText=""
			}
		};
		Element.Properties.tag={
			get:function(){
				return this.tagName.toLowerCase()
			}
		};
		Element.Properties.html=(function(){
			var c=document.createElement("div");
			var a={
				table:[1,"<table>","</table>"],
				select:[1,"<select>","</select>"],
				tbody:[2,"<table><tbody>","</tbody></table>"],
				tr:[3,"<table><tbody><tr>","</tr></tbody></table>"]
			};
			a.thead=a.tfoot=a.tbody;
			var b={
				set:function(){
					var f=Array.flatten(arguments).join("");
					var g=Browser.Engine.trident&&a[this.get("tag")];
					if(g){
						var h=c;
						h.innerHTML=g[1]+f+g[2];
						for(var d=g[0];d--;){
							h=h.firstChild
						}
						this.empty().adopt(h.childNodes)
					}else{
						this.innerHTML=f
					}
				}
			};
			b.erase=b.set;return b
		})();
		if(Browser.Engine.webkit&&Browser.Engine.version<420){
			Element.Properties.text={
				get:function(){
					if(this.innerText){
						return this.innerText
					}
					var a=this.ownerDocument.newElement("div",{
						html:this.innerHTML
					}).inject(this.ownerDocument.body);
					var b=a.innerText;
					a.destroy();
					return b
				}
			}
		}
		(function(){
			Element.implement({
				scrollTo:function(j,k){
					if(b(this)){
						this.getWindow().scrollTo(j,k)
					}else{
						this.scrollLeft=j;
						this.scrollTop=k
					}
					return this
				},
				getSize:function(){
					if(b(this)){
						return this.getWindow().getSize()
					}
					return{x:this.offsetWidth,y:this.offsetHeight}
				},
				getScrollSize:function(){
					if(b(this)){
						return this.getWindow().getScrollSize()
					}
					return{x:this.scrollWidth,y:this.scrollHeight}
				},
				getScroll:function(){
					if(b(this)){
						return this.getWindow().getScroll()
					}
					return{x:this.scrollLeft,y:this.scrollTop}
				},
				getScrolls:function(){
					var k=this,j={x:0,y:0};
					while(k&&!b(k)){
						j.x+=k.scrollLeft;
						j.y+=k.scrollTop;
						k=k.parentNode
					}
					return j
				},
				getOffsetParent:function(){
					var j=this;if(b(j)){
						return null
					}
					if(!Browser.Engine.trident){
						return j.offsetParent
					}
					while((j=j.parentNode)&&!b(j)){
						if(d(j,"position")!="static"){
							return j
						}
					}
					return null
				},
				getOffsets:function(){
					if(this.getBoundingClientRect){
						var l=this.getBoundingClientRect(),
						o=document.id(this.getDocument().documentElement),
						s=o.getScroll(),
						m=this.getScrolls(),
						k=this.getScroll(),
						j=(d(this,"position")=="fixed");
						return{x:l.left.toInt()+m.x-k.x+((j)?0:s.x)-o.clientLeft,y:l.top.toInt()+m.y-k.y+((j)?0:s.y)-o.clientTop}
					}
					var n=this,q={x:0,y:0};
					if(b(this)){
						return q
					}
					while(n&&!b(n)){
						q.x+=n.offsetLeft;
						q.y+=n.offsetTop;
						if(Browser.Engine.gecko){
							if(!g(n)){
								q.x+=c(n);
								q.y+=h(n)
							}
							var r=n.parentNode;
							if(r&&d(r,"overflow")!="visible"){
								q.x+=c(r);
								q.y+=h(r)
							}
						}else{
							if(n!=this&&Browser.Engine.webkit){
								q.x+=c(n);
								q.y+=h(n)
							}
						}
						n=n.offsetParent
					}
					if(Browser.Engine.gecko&&!g(this)){
						q.x-=c(this);
						q.y-=h(this)
					}
					return q
				},
				getPosition:function(m){
					if(b(this)){
						return{x:0,y:0}
					}
					var n=this.getOffsets(),k=this.getScrolls();
					var j={x:n.x-k.x,y:n.y-k.y};
					var l=(m&&(m=document.id(m)))?m.getPosition():{x:0,y:0};
					return{x:j.x-l.x,y:j.y-l.y}
				},
				getCoordinates:function(l){
					if(b(this)){
						return this.getWindow().getCoordinates()
					}
					var j=this.getPosition(l),k=this.getSize();
					var m={left:j.x,top:j.y,width:k.x,height:k.y};
					m.right=m.left+m.width;
					m.bottom=m.top+m.height;
					return m
				},
				computePosition:function(j){
					return{
						left:j.x-f(this,"margin-left"),
						top:j.y-f(this,"margin-top")
					}
				},
				setPosition:function(j){
					return this.setStyles(this.computePosition(j))
				}
			});
			Native.implement([Document,Window],{
				getSize:function(){
					if(Browser.Engine.presto||Browser.Engine.webkit){
						var k=this.getWindow();
						return{
							x:k.innerWidth,
							y:k.innerHeight
						}
					}
					var j=a(this);
					return{
						x:j.clientWidth,
						y:j.clientHeight
					}
				},
				getScroll:function(){
					var k=this.getWindow(),j=a(this);
					return{
						x:k.pageXOffset||j.scrollLeft,
						y:k.pageYOffset||j.scrollTop
					}
				},
				getScrollSize:function(){
					var k=a(this),
					j=this.getSize();
					return{
						x:Math.max(k.scrollWidth,j.x),
						y:Math.max(k.scrollHeight,j.y)
					}
				},
				getPosition:function(){
					return{x:0,y:0}
				},
				getCoordinates:function(){
					var j=this.getSize();
					return{
						top:0,
						left:0,
						bottom:j.y,
						right:j.x,
						height:j.y,
						width:j.x
					}
				}
			});
			var d=Element.getComputedStyle;
			function f(j,k){
				return d(j,k).toInt()||0
			}
			function g(j){
				return d(j,"-moz-box-sizing")=="border-box"
			}
			function h(j){
				return f(j,"border-top-width")
			}
			function c(j){
				return f(j,"border-left-width")
			}
			function b(j){
				return(/^(?:body|html)$/i).test(j.tagName)
			}
			function a(j){
				var k=j.getDocument();
				return(!k.compatMode||k.compatMode=="CSS1Compat")?k.html:k.body
			}
		})();
		Element.alias("setPosition","position");
		Native.implement([Window,Document,Element],{
			getHeight:function(){
				return this.getSize().y
			},
			getWidth:function(){
				return this.getSize().x
			},
			getScrollTop:function(){
				return this.getScroll().y
			},
			getScrollLeft:function(){
				return this.getScroll().x
			},
			getScrollHeight:function(){
				return this.getScrollSize().y
			},
			getScrollWidth:function(){
				return this.getScrollSize().x
			},
			getTop:function(){
				return this.getPosition().y
			},
			getLeft:function(){
				return this.getPosition().x
			}
		});
		var Event=new Native({
			name:"Event",
			initialize:function(a,g){
				g=g||window;
				var m=g.document;
				a=a||g.event;
				if(a.$extended){
					return a
				}
				this.$extended=true;
				var l=a.type;
				var h=a.target||a.srcElement;
				while(h&&h.nodeType==3){
					h=h.parentNode
				}
				if(l.test(/key/)){
					var b=a.which||a.keyCode;
					var o=Event.Keys.keyOf(b);
					if(l=="keydown"){
						var d=b-111;
						if(d>0&&d<13){
							o="f"+d
						}
					}
					o=o||String.fromCharCode(b).toLowerCase()
				}else{
					if(l.match(/(click|mouse|menu)/i)){
						m=(!m.compatMode||m.compatMode=="CSS1Compat")?m.html:m.body;
						var k={
							x:a.pageX||a.clientX+m.scrollLeft,
							y:a.pageY||a.clientY+m.scrollTop
						};
						var c={
							x:(a.pageX)?a.pageX-g.pageXOffset:a.clientX,
							y:(a.pageY)?a.pageY-g.pageYOffset:a.clientY
						};
						if(l.match(/DOMMouseScroll|mousewheel/)){
							var j=(a.wheelDelta)?a.wheelDelta/120:-(a.detail||0)/3
						}
						var f=(a.which==3)||(a.button==2);
						var n=null;
						if(l.match(/over|out/)){
							switch(l){
								case"mouseover":n=a.relatedTarget||a.fromElement;
								break;
								case"mouseout":n=a.relatedTarget||a.toElement
							}
							if(!(function(){
								while(n&&n.nodeType==3){
									n=n.parentNode
								}
								return true
							}).create({
								attempt:Browser.Engine.gecko
							})()){
								n=false
							}
						}
					}
				}
				return $extend(this,{
					event:a,
					type:l,
					page:k,
					client:c,
					rightClick:f,
					wheel:j,
					relatedTarget:n,
					target:h,
					code:b,
					key:o,
					shift:a.shiftKey,
					control:a.ctrlKey,
					alt:a.altKey,
					meta:a.metaKey
				})
			}
		});
		Event.Keys=new Hash({
			enter:13,
			up:38,
			down:40,
			left:37,
			right:39,
			esc:27,
			space:32,
			backspace:8,
			tab:9,
			"delete":46
		});
		Event.implement({
			stop:function(){
				return this.stopPropagation().preventDefault()
			},
			stopPropagation:function(){
				if(this.event.stopPropagation){
					this.event.stopPropagation()
				}else{
					this.event.cancelBubble=true
				}
				return this
			},
			preventDefault:function(){
				if(this.event.preventDefault){
					this.event.preventDefault()
				}else{
					this.event.returnValue=false
				}
				return this
			}
		});
		Element.Properties.events={
			set:function(a){
				this.addEvents(a)
			}
		};
		Native.implement([Element,Window,Document],{
			addEvent:function(f,h){
				var j=this.retrieve("events",{});
				j[f]=j[f]||{
					keys:[],
					values:[]
				};
				if(j[f].keys.contains(h)){
					return this
				}
				j[f].keys.push(h);
				var g=f,a=Element.Events.get(f),c=h,k=this;
				if(a){
					if(a.onAdd){
						a.onAdd.call(this,h)
					}
					if(a.condition){
						c=function(l){
							if(a.condition.call(this,l)){
								return h.call(this,l)
							}
							return true
						}
					}
					g=a.base||g
				}
				var d=function(){
					return h.call(k)
				};
				var b=Element.NativeEvents[g];
				if(b){
					if(b==2){
						d=function(l){
							l=new Event(l,k.getWindow());
							if(c.call(k,l)===false){
								l.stop()
							}
						}
					}
					this.addListener(g,d)
				}
				j[f].values.push(d);
				return this
			},
			removeEvent:function(c,b){
				var a=this.retrieve("events");
				if(!a||!a[c]){
					return this
				}
				var g=a[c].keys.indexOf(b);
				if(g==-1){
					return this
				}
				a[c].keys.splice(g,1);
				var f=a[c].values.splice(g,1)[0];
				var d=Element.Events.get(c);
				if(d){
					if(d.onRemove){
						d.onRemove.call(this,b)
					}
					c=d.base||c
				}
				return(Element.NativeEvents[c])?this.removeListener(c,f):this
			},
			addEvents:function(a){
				for(var b in a){
					this.addEvent(b,a[b])
				}
				return this
			},
			removeEvents:function(a){
				var c;
				if($type(a)=="object"){
					for(c in a){
						this.removeEvent(c,a[c])
					}
					return this
				}
				var b=this.retrieve("events");
				if(!b){
					return this
				}
				if(!a){
					for(c in b){
						this.removeEvents(c)
					}
					this.eliminate("events")
				}else{
					if(b[a]){
						while(b[a].keys[0]){
							this.removeEvent(a,b[a].keys[0])
						}
						b[a]=null
					}
				}
				return this
			},
			fireEvent:function(d,b,a){
				var c=this.retrieve("events");
				if(!c||!c[d]){
					return this
				}
				c[d].keys.each(function(f){
					f.create({
						bind:this,
						delay:a,
						"arguments":b
					})()
				},this);
				return this
			},
			cloneEvents:function(d,a){
				d=document.id(d);
				var c=d.retrieve("events");
				if(!c){
					return this
				}
				if(!a){
					for(var b in c){
						this.cloneEvents(d,b)
					}
				}else{
					if(c[a]){
						c[a].keys.each(function(f){
							this.addEvent(a,f)
						},this)
					}
				}
				return this
			}
		});
		try{
			if(typeof HTMLElement!="undefined"){
				HTMLElement.prototype.fireEvent=Element.prototype.fireEvent
			}
		}
		catch(e){}
		Element.NativeEvents={
			click:2,
			dblclick:2,
			mouseup:2,
			mousedown:2,
			contextmenu:2,
			mousewheel:2,
			DOMMouseScroll:2,
			mouseover:2,
			mouseout:2,
			mousemove:2,
			selectstart:2,
			selectend:2,
			keydown:2,
			keypress:2,
			keyup:2,
			focus:2,
			blur:2,
			change:2,
			reset:2,
			select:2,
			submit:2,
			load:1,
			unload:1,
			beforeunload:2,
			resize:1,
			move:1,
			DOMContentLoaded:1,
			readystatechange:1,
			error:1,
			abort:1,
			scroll:1
		};
		(function(){
			var a=function(b){
				var c=b.relatedTarget;
				if(c==undefined){
					return true
				}
				if(c===false){
					return false
				}
				return($type(this)!="document"&&c!=this&&c.prefix!="xul"&&!this.hasChild(c))
			};
			Element.Events=new Hash({
				mouseenter:{
					base:"mouseover",
					condition:a
				},
				mouseleave:{
					base:"mouseout",
					condition:a
				},
				mousewheel:{
					base:(Browser.Engine.gecko)?"DOMMouseScroll":"mousewheel"
				}
			})
		})();
		Element.Properties.styles={
			set:function(a){
				this.setStyles(a)
			}
		};
		Element.Properties.opacity={
			set:function(a,b){
				if(!b){
					if(a==0){
						if(this.style.visibility!="hidden"){
							this.style.visibility="hidden"
						}
					}else{
						if(this.style.visibility!="visible"){
							this.style.visibility="visible"
						}
					}
				}
				if(!this.currentStyle||!this.currentStyle.hasLayout){
					this.style.zoom=1
				}
				if(Browser.Engine.trident){
					this.style.filter=(a==1)?"":"alpha(opacity="+a*100+")"
				}
				this.style.opacity=a;
				this.store("opacity",a)
			},
			get:function(){
				return this.retrieve("opacity",1)
			}
		};
		Element.implement({
			setOpacity:function(a){
				return this.set("opacity",a,true)
			},
			getOpacity:function(){
				return this.get("opacity")
			},
			setStyle:function(b,a){
				switch(b){
					case"opacity":return this.set("opacity",parseFloat(a));
					case"float":b=(Browser.Engine.trident)?"styleFloat":"cssFloat"
				}
				b=b.camelCase();
				if($type(a)!="string"){
					var c=(Element.Styles.get(b)||"@").split(" ");
					a=$splat(a).map(function(f,d){
						if(!c[d]){
							return""
						}
						return($type(f)=="number")?c[d].replace("@",Math.round(f)):f
					}).join(" ")
				}else{
					if(a==String(Number(a))){
						a=Math.round(a)
					}
				}
				this.style[b]=a;
				return this
			},
			getStyle:function(h){
				switch(h){
					case"opacity":return this.get("opacity");
					case"float":h=(Browser.Engine.trident)?"styleFloat":"cssFloat"
				}
				h=h.camelCase();
				var a=this.style[h];
				if(!$chk(a)){
					a=[];
					for(var g in Element.ShortStyles){
						if(h!=g){
							continue
						}
						for(var f in Element.ShortStyles[g]){
							a.push(this.getStyle(f))
						}
						return a.join(" ")
					}
					a=this.getComputedStyle(h)
				}
				if(a){
					a=String(a);
					var c=a.match(/rgba?\([\d\s,]+\)/);
					if(c){
						a=a.replace(c[0],c[0].rgbToHex())
					}
				}
				if(Browser.Engine.presto||(Browser.Engine.trident&&!$chk(parseInt(a,10)))){
					if(h.test(/^(height|width)$/)){
						var b=(h=="width")?["left","right"]:["top","bottom"],
						d=0;
						b.each(function(j){
							d+=this.getStyle("border-"+j+"-width").toInt()+this.getStyle("padding-"+j).toInt()
						},this);
						return this["offset"+h.capitalize()]-d+"px"
					}
					if((Browser.Engine.presto)&&String(a).test("px")){
						return a
					}
					if(h.test(/(border(.+)Width|margin|padding)/)){
						return"0px"
					}
				}
				return a
			},
			setStyles:function(b){
				for(var a in b){
					this.setStyle(a,b[a])
				}
				return this
			},
			getStyles:function(){
				var a={};
				Array.flatten(arguments).each(function(b){
					a[b]=this.getStyle(b)
				},this);
				return a
			}
		});
		Element.Styles=new Hash({
			left:"@px",
			top:"@px",
			bottom:"@px",
			right:"@px",
			width:"@px",
			height:"@px",
			maxWidth:"@px",
			maxHeight:"@px",
			minWidth:"@px",
			minHeight:"@px",
			backgroundColor:"rgb(@, @, @)",
			backgroundPosition:"@px @px",
			color:"rgb(@, @, @)",
			fontSize:"@px",
			letterSpacing:"@px",
			lineHeight:"@px",
			clip:"rect(@px @px @px @px)",
			margin:"@px @px @px @px",
			padding:"@px @px @px @px",
			border:"@px @ rgb(@, @, @) @px @ rgb(@, @, @) @px @ rgb(@, @, @)",
			borderWidth:"@px @px @px @px",
			borderStyle:"@ @ @ @",
			borderColor:"rgb(@, @, @) rgb(@, @, @) rgb(@, @, @) rgb(@, @, @)",
			zIndex:"@",
			zoom:"@",
			fontWeight:"@",
			textIndent:"@px",
			opacity:"@"
		});
		Element.ShortStyles={
			margin:{},
			padding:{},
			border:{},
			borderWidth:{},
			borderStyle:{},
			borderColor:{}
		};
		["Top","Right","Bottom","Left"].each(function(h){
			var g=Element.ShortStyles;
			var b=Element.Styles;
			["margin","padding"].each(function(j){
				var k=j+h;
				g[j][k]=b[k]="@px"
			});
			var f="border"+h;
			g.border[f]=b[f]="@px @ rgb(@, @, @)";
			var d=f+"Width",a=f+"Style",c=f+"Color";
			g[f]={};
			g.borderWidth[d]=g[f][d]=b[d]="@px";
			g.borderStyle[a]=g[f][a]=b[a]="@";
			g.borderColor[c]=g[f][c]=b[c]="rgb(@, @, @)"
		});
		var Fx=new Class({
			Implements:[Chain,Events,Options],
			options:{
				fps:50,
				unit:false,
				duration:500,
				link:"ignore"
			},
			initialize:function(a){
				this.subject=this.subject||this;
				this.setOptions(a);
				this.options.duration=Fx.Durations[this.options.duration]||this.options.duration.toInt();
				var b=this.options.wait;
				if(b===false){
					this.options.link="cancel"
				}
			},
			getTransition:function(){
				return function(a){
					return -(Math.cos(Math.PI*a)-1)/2
				}
			},
			step:function(){
				var a=$time();
				if(a<this.time+this.options.duration){
					var b=this.transition((a-this.time)/this.options.duration);
					this.set(this.compute(this.from,this.to,b))
				}else{
					this.set(this.compute(this.from,this.to,1));
					this.complete()
				}
			},
			set:function(a){
				return a
			},
			compute:function(c,b,a){
				return Fx.compute(c,b,a)
			},
			check:function(){
				if(!this.timer){
					return true
				}
				switch(this.options.link){
					case"cancel":this.cancel();
					return true;
					case"chain":this.chain(this.caller.bind(this,arguments));
					return false
				}
				return false
			},
			start:function(b,a){
				if(!this.check(b,a)){
					return this
				}
				this.from=b;
				this.to=a;
				this.time=0;
				this.transition=this.getTransition();
				this.startTimer();
				this.onStart();
				return this
			},
			complete:function(){
				if(this.stopTimer()){
					this.onComplete()
				}
				return this
			},
			cancel:function(){
				if(this.stopTimer()){
					this.onCancel()
				}
				return this
			},
			onStart:function(){
				this.fireEvent("start",this.subject)
			},
			onComplete:function(){
				this.fireEvent("complete",this.subject);
				if(!this.callChain()){
					this.fireEvent("chainComplete",this.subject)
				}
			},
			onCancel:function(){
				this.fireEvent("cancel",this.subject).clearChain()
			},
			pause:function(){
				this.stopTimer();
				return this
			},
			resume:function(){
				this.startTimer();
				return this
			},
			stopTimer:function(){
				if(!this.timer){
					return false
				}
				this.time=$time()-this.time;
				this.timer=$clear(this.timer);
				return true
			},
			startTimer:function(){
				if(this.timer){
					return false
				}
				this.time=$time()-this.time;
				this.timer=this.step.periodical(Math.round(1000/this.options.fps),this);
				return true
			}
		});
		Fx.compute=function(c,b,a){
			return(b-c)*a+c
		};
		Fx.Durations={
			"short":250,
			normal:500,
			"long":1000
		};
		Fx.CSS=new Class({
			Extends:Fx,
			prepare:function(d,f,b){
				b=$splat(b);
				var c=b[1];
				if(!$chk(c)){
					b[1]=b[0];
					b[0]=d.getStyle(f)
				}
				var a=b.map(this.parse);
				return{
					from:a[0],
					to:a[1]
				}
			},
			parse:function(a){
				a=$lambda(a)();
				a=(typeof a=="string")?a.split(" "):$splat(a);
				return a.map(function(c){
					c=String(c);
					var b=false;
					Fx.CSS.Parsers.each(function(g,f){
						if(b){
							return
						}
						var d=g.parse(c);
						if($chk(d)){
							b={
								value:d,parser:g
							}
						}
					});
					b=b||{
						value:c,
						parser:Fx.CSS.Parsers.String
					};
					return b
				})
			},
			compute:function(d,c,b){
				var a=[];
				(Math.min(d.length,c.length)).times(function(f){
					a.push({
						value:d[f].parser.compute(d[f].value,c[f].value,b),
						parser:d[f].parser
					})
				});
				a.$family={
					name:"fx:css:value"
				};
				return a
			},
			serve:function(c,b){
				if($type(c)!="fx:css:value"){
					c=this.parse(c)
				}
				var a=[];
				c.each(function(d){
					a=a.concat(d.parser.serve(d.value,b))
				});
				return a
			},
			render:function(a,d,c,b){
				a.setStyle(d,this.serve(c,b))
			},
			search:function(a){
				if(Fx.CSS.Cache[a]){
					return Fx.CSS.Cache[a]
				}
				var b={};
				Array.each(document.styleSheets,function(f,d){
					var c=f.href;
					if(c&&c.contains("://")&&!c.contains(document.domain)){
						return
					}
					var g=f.rules||f.cssRules;
					Array.each(g,function(k,h){
						if(!k.style){
							return
						}
						var j=(k.selectorText)?k.selectorText.replace(/^\w+/,function(l){
							return l.toLowerCase()
						}):null;
						if(!j||!j.test("^"+a+"$")){
							return
						}
						Element.Styles.each(function(m,l){
							if(!k.style[l]||Element.ShortStyles[l]){
								return
							}
							m=String(k.style[l]);
							b[l]=(m.test(/^rgb/))?m.rgbToHex():m
						})
					})
				});
				return Fx.CSS.Cache[a]=b
			}
		});
		Fx.CSS.Cache={};
		Fx.CSS.Parsers=new Hash({
			Color:{
				parse:function(a){
					if(a.match(/^#[0-9a-f]{3,6}$/i)){
						return a.hexToRgb(true)
					}
					return((a=a.match(/(\d+),\s*(\d+),\s*(\d+)/)))?[a[1],a[2],a[3]]:false
				},
				compute:function(c,b,a){
					return c.map(function(f,d){
						return Math.round(Fx.compute(c[d],b[d],a))
					})
				},
				serve:function(a){
					return a.map(Number)
				}
			},
			Number:{
				parse:parseFloat,
				compute:Fx.compute,
				serve:function(b,a){
					return(a)?b+a:b
				}
			},
			String:{
				parse:$lambda(false),
				compute:$arguments(1),
				serve:$arguments(0)
			}
		});
		Fx.Morph=new Class({
			Extends:Fx.CSS,
			initialize:function(b,a){
				this.element=this.subject=document.id(b);
				this.parent(a)
			},
			set:function(a){
				if(typeof a=="string"){
					a=this.search(a)
				}
				for(var b in a){
					this.render(this.element,b,a[b],this.options.unit)
				}
				return this
			},
			compute:function(f,d,c){
				var a={};
				for(var b in f){
					a[b]=this.parent(f[b],d[b],c)
				}
				return a
			},
			start:function(b){
				if(!this.check(b)){
					return this
				}
				if(typeof b=="string"){
					b=this.search(b)
				}
				var f={},d={};
				for(var c in b){
					var a=this.prepare(this.element,c,b[c]);
					f[c]=a.from;
					d[c]=a.to
				}
				return this.parent(f,d)
			}
		});
		Element.Properties.morph={
			set:function(a){
				var b=this.retrieve("morph");
				if(b){
					b.cancel()
				}
				return this.eliminate("morph").store("morph:options",$extend({link:"cancel"},a))
			},
			get:function(a){
				if(a||!this.retrieve("morph")){
					if(a||!this.retrieve("morph:options")){
						this.set("morph",a)
					}
					this.store("morph",new Fx.Morph(this,this.retrieve("morph:options")))
				}
				return this.retrieve("morph")
			}
		};
		Element.implement({
			morph:function(a){
				this.get("morph").start(a);
				return this
			}
		});
		Fx.implement({
			getTransition:function(){
				var a=this.options.transition||Fx.Transitions.Sine.easeInOut;
				if(typeof a=="string"){
					var b=a.split(":");
					a=Fx.Transitions;
					a=a[b[0]]||a[b[0].capitalize()];
					if(b[1]){
						a=a["ease"+b[1].capitalize()+(b[2]?b[2].capitalize():"")]
					}
				}
				return a
			}
		});
		Fx.Transition=function(b,a){
			a=$splat(a);
			return $extend(b,{
				easeIn:function(c){
					return b(c,a)
				},
				easeOut:function(c){
					return 1-b(1-c,a)
				},
				easeInOut:function(c){
					return(c<=0.5)?b(2*c,a)/2:(2-b(2*(1-c),a))/2
				}
			})
		};
		Fx.Transitions=new Hash({
			linear:$arguments(0)
		});
		Fx.Transitions.extend=function(a){
			for(var b in a){
				Fx.Transitions[b]=new Fx.Transition(a[b])
			}
		};
		Fx.Transitions.extend({
			Pow:function(b,a){
				return Math.pow(b,a[0]||6)
			},
			Expo:function(a){
				return Math.pow(2,8*(a-1))
			},
			Circ:function(a){
				return 1-Math.sin(Math.acos(a))
			},
			Sine:function(a){
				return 1-Math.sin((1-a)*Math.PI/2)
			},
			Back:function(b,a){
				a=a[0]||1.618;
				return Math.pow(b,2)*((a+1)*b-a)
			},
			Bounce:function(g){
				var f;
				for(var d=0,c=1;1;d+=c,c/=2){
					if(g>=(7-4*d)/11){
						f=c*c-Math.pow((11-6*d-11*g)/4,2);
						break
					}
				}
				return f
			},
			Elastic:function(b,a){
				return Math.pow(2,10*--b)*Math.cos(20*b*Math.PI*(a[0]||1)/3)
			}
		});
		["Quad","Cubic","Quart","Quint"].each(function(b,a){
			Fx.Transitions[b]=new Fx.Transition(function(c){
				return Math.pow(c,[a+2])
			})
		});
		Fx.Tween=new Class({
			Extends:Fx.CSS,
			initialize:function(b,a){
				this.element=this.subject=document.id(b);
				this.parent(a)
			},
			set:function(b,a){
				if(arguments.length==1){
					a=b;
					b=this.property||this.options.property
				}
				this.render(this.element,b,a,this.options.unit);
				return this
			},
			start:function(c,f,d){
				if(!this.check(c,f,d)){
					return this
				}
				var b=Array.flatten(arguments);
				this.property=this.options.property||b.shift();
				var a=this.prepare(this.element,this.property,b);
				return this.parent(a.from,a.to)
			}
		});
		Element.Properties.tween={
			set:function(a){
				var b=this.retrieve("tween");
				if(b){
					b.cancel()
				}
				return this.eliminate("tween").store("tween:options",$extend({link:"cancel"},a))
			},
			get:function(a){
				if(a||!this.retrieve("tween")){
					if(a||!this.retrieve("tween:options")){
						this.set("tween",a)
					}
					this.store("tween",new Fx.Tween(this,this.retrieve("tween:options")))
				}
				return this.retrieve("tween")
			}
		};
		Element.implement({
			tween:function(a,c,b){
				this.get("tween").start(arguments);
				return this
			},
			fade:function(c){
				var f=this.get("tween"),d="opacity",a;
				c=$pick(c,"toggle");
				switch(c){
					case"in":f.start(d,1);
					break;
					case"out":f.start(d,0);
					break;
					case"show":f.set(d,1);
					break;
					case"hide":f.set(d,0);
					break;
					case"toggle":var b=this.retrieve("fade:flag",this.get("opacity")==1);
					f.start(d,(b)?0:1);
					this.store("fade:flag",!b);
					a=true;
					break;
					default:f.start(d,arguments)
				}
				if(!a){
					this.eliminate("fade:flag")
				}
				return this
			},
			highlight:function(c,a){
				if(!a){
					a=this.retrieve("highlight:original",this.getStyle("background-color"));
					a=(a=="transparent")?"#fff":a
				}
				var b=this.get("tween");
				b.start("background-color",c||"#ffff88",a).chain(function(){
					this.setStyle("background-color",this.retrieve("highlight:original"));
					b.callChain()
				}.bind(this));
				return this
			}
		});
		var Request=new Class({
			Implements:[Chain,Events,Options],
			options:{
				url:"",
				data:"",
				headers:{
					"X-Requested-With":"XMLHttpRequest",
					Accept:"text/javascript, text/html, application/xml, text/xml, */*"
				},
				async:true,
				format:false,
				method:"post",
				link:"ignore",
				isSuccess:null,
				emulation:true,
				urlEncoded:true,
				encoding:"utf-8",
				evalScripts:false,
				evalResponse:false,
				noCache:false
			},
			initialize:function(a){
				this.xhr=new Browser.Request();
				this.setOptions(a);
				this.options.isSuccess=this.options.isSuccess||this.isSuccess;this.headers=new Hash(this.options.headers)
			},
			onStateChange:function(){
				if(this.xhr.readyState!=4||!this.running){
					return
				}
				this.running=false;
				this.status=0;
				$try(function(){
					this.status=this.xhr.status
				}.bind(this));
				this.xhr.onreadystatechange=$empty;
				if(this.options.isSuccess.call(this,this.status)){
					this.response={
						text:this.xhr.responseText,
						xml:this.xhr.responseXML
					};
					this.success(this.response.text,this.response.xml)
				}else{
					this.response={
						text:null,
						xml:null
					};
					this.failure()
				}
			},
			isSuccess:function(){
				return((this.status>=200)&&(this.status<300))
			},
			processScripts:function(a){
				if(this.options.evalResponse||(/(ecma|java)script/).test(this.getHeader("Content-type"))){
					return $exec(a)
				}
				return a.stripScripts(this.options.evalScripts)
			},
			success:function(b,a){
				this.onSuccess(this.processScripts(b),a)
			},
			onSuccess:function(){
				this.fireEvent("complete",arguments).fireEvent("success",arguments).callChain()
			},
			failure:function(){
				this.onFailure()
			},
			onFailure:function(){
				this.fireEvent("complete").fireEvent("failure",this.xhr)
			},
			setHeader:function(a,b){
				this.headers.set(a,b);
				return this
			},
			getHeader:function(a){
				return $try(function(){
					return this.xhr.getResponseHeader(a)
				}.bind(this))
			},
			check:function(){
				if(!this.running){
					return true
				}
				switch(this.options.link){
					case"cancel":this.cancel();
					return true;
					case"chain":this.chain(this.caller.bind(this,arguments));
					return false
				}
				return false
			},
			send:function(m){
				if(!this.check(m)){
					return this
				}
				this.running=true;
				var k=$type(m);
				if(k=="string"||k=="element"){
					m={data:m}
				}
				var d=this.options;
				m=$extend({
					data:d.data,
					url:d.url,
					method:d.method
				},m);
				var h=m.data,b=String(m.url),a=m.method.toLowerCase();
				switch($type(h)){
					case"element":h=document.id(h).toQueryString();
					break;
					case"object":case"hash":h=Hash.toQueryString(h)
				}
				if(this.options.format){
					var l="format="+this.options.format;
					h=(h)?l+"&"+h:l
				}
				if(this.options.emulation&&!["get","post"].contains(a)){
					var j="_method="+a;
					h=(h)?j+"&"+h:j;
					a="post"
				}
				if(this.options.urlEncoded&&a=="post"){
					var c=(this.options.encoding)?"; charset="+this.options.encoding:"";
					this.headers.set("Content-type","application/x-www-form-urlencoded"+c)
				}
				if(this.options.noCache){
					var g="noCache="+new Date().getTime();
					h=(h)?g+"&"+h:g
				}
				var f=b.lastIndexOf("/");
				if(f>-1&&(f=b.indexOf("#"))>-1){
					b=b.substr(0,f)
				}
				if(h&&a=="get"){
					b=b+(b.contains("?")?"&":"?")+h;h=null
				}
				this.xhr.open(a.toUpperCase(),b,this.options.async);
				this.xhr.onreadystatechange=this.onStateChange.bind(this);
				this.headers.each(function(o,n){
					try{
						this.xhr.setRequestHeader(n,o)
					}
					catch(q){
						this.fireEvent("exception",[n,o])
					}
				},this);
				this.fireEvent("request");
				this.xhr.send(h);
				if(!this.options.async){
					this.onStateChange()
				}
				return this
			},
			cancel:function(){
				if(!this.running){
					return this
				}
				this.running=false;
				this.xhr.abort();
				this.xhr.onreadystatechange=$empty;
				this.xhr=new Browser.Request();
				this.fireEvent("cancel");
				return this
			}
		});
		(function(){
			var a={};
			["get","post","put","delete","GET","POST","PUT","DELETE"].each(function(b){
				a[b]=function(){
					var c=Array.link(arguments,{
						url:String.type,data:$defined
					});
					return this.send($extend(c,{method:b}))
				}
			});
			Request.implement(a)
		})();
		Element.Properties.send={
			set:function(a){
				var b=this.retrieve("send");
				if(b){
					b.cancel()
				}
				return this.eliminate("send").store("send:options",$extend({
					data:this,
					link:"cancel",
					method:this.get("method")||"post",
					url:this.get("action")
				},a))
			},
			get:function(a){
				if(a||!this.retrieve("send")){
					if(a||!this.retrieve("send:options")){
						this.set("send",a)
					}
					this.store("send",new Request(this.retrieve("send:options")))
				}
				return this.retrieve("send")
			}
		};
		Element.implement({
			send:function(a){
				var b=this.get("send");
				b.send({
					data:this,
					url:a||b.options.url
				});
				return this
			}
		});
		Request.HTML=new Class({
			Extends:Request,
			options:{
				update:false,
				append:false,
				evalScripts:true,
				filter:false
			},
			processHTML:function(c){
				var b=c.match(/<body[^>]*>([\s\S]*?)<\/body>/i);
				c=(b)?b[1]:c;
				var a=new Element("div");
				return $try(function(){
					var d="<root>"+c+"</root>",h;
					if(Browser.Engine.trident){
						h=new ActiveXObject("Microsoft.XMLDOM");
						h.async=false;
						h.loadXML(d)
					}else{
						h=new DOMParser().parseFromString(d,"text/xml")
					}
					d=h.getElementsByTagName("root")[0];
					if(!d){
						return null
					}
					for(var g=0,f=d.childNodes.length;g<f;g++){
						var j=Element.clone(d.childNodes[g],true,true);
						if(j){
							a.grab(j)
						}
					}
					return a
				})||a.set("html",c)
			},
			success:function(d){
				var c=this.options,b=this.response;
				b.html=d.stripScripts(function(f){
					b.javascript=f
				});
				var a=this.processHTML(b.html);
				b.tree=a.childNodes;
				b.elements=a.getElements("*");
				if(c.filter){
					b.tree=b.elements.filter(c.filter)
				}
				if(c.update){
					document.id(c.update).empty().set("html",b.html)
				}else{
					if(c.append){
						document.id(c.append).adopt(a.getChildren())
					}
				}
				if(c.evalScripts){
					$exec(b.javascript)
				}
				this.onSuccess(b.tree,b.elements,b.html,b.javascript)
			}
		});
		Element.Properties.load={
			set:function(a){
				var b=this.retrieve("load");
				if(b){
					b.cancel()
				}
				return this.eliminate("load").store("load:options",$extend({
					data:this,
					link:"cancel",
					update:this,
					method:"get"
				},a))
			},
			get:function(a){
				if(a||!this.retrieve("load")){
					if(a||!this.retrieve("load:options")){
						this.set("load",a)
					}
					this.store("load",new Request.HTML(this.retrieve("load:options")))
				}
				return this.retrieve("load")
			}
		};
		Element.implement({
			load:function(){
				this.get("load").send(Array.link(arguments,{
					data:Object.type,
					url:String.type
				}));
				return this
			}
		});
		var JSON=new Hash(this.JSON&&{stringify:JSON.stringify,parse:JSON.parse}).extend({
			$specialChars:{"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},
			$replaceChars:function(a){
				return JSON.$specialChars[a]||"\\u00"+Math.floor(a.charCodeAt()/16).toString(16)+(a.charCodeAt()%16).toString(16)
				},
				encode:function(b){
					switch($type(b)){
						case"string":return'"'+b.replace(/[\x00-\x1f\\"]/g,JSON.$replaceChars)+'"';
						case"array":return"["+String(b.map(JSON.encode).clean())+"]";
						case"object":case"hash":var a=[];
						Hash.each(b,function(f,d){
							var c=JSON.encode(f);
							if(c){
								a.push(JSON.encode(d)+":"+c)
							}
						});
						return"{"+a+"}";
						case"number":case"boolean":return String(b);
						case false:return"null"
					}
					return null
				},
				decode:function(string,secure){
					if($type(string)!="string"||!string.length){
						return null
					}
					if(secure&&!(/^[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]*$/).test(string.replace(/\\./g,"@").replace(/"[^"\\\n\r]*"/g,""))){
						return null
					}
					return eval("("+string+")")
				}
			});
			Request.JSON=new Class({
				Extends:Request,options:{secure:true},
				initialize:function(a){
					this.parent(a);
					this.headers.extend({
						Accept:"application/json",
						"X-Request":"JSON"
					})
				},
				success:function(a){
					this.response.json=JSON.decode(a,this.options.secure);
					this.onSuccess(this.response.json,a)
				}
			});
			var Cookie=new Class({
				Implements:Options,
				options:{
					path:false,
					domain:false,
					duration:false,
					secure:false,
					document:document
				},
				initialize:function(b,a){
					this.key=b;
					this.setOptions(a)
				},
				write:function(b){
					b=encodeURIComponent(b);
					if(this.options.domain){
						b+="; domain="+this.options.domain
					}
					if(this.options.path){
						b+="; path="+this.options.path
					}
					if(this.options.duration){
						var a=new Date();
						a.setTime(a.getTime()+this.options.duration*24*60*60*1000);
						b+="; expires="+a.toGMTString()
					}
					if(this.options.secure){b+="; secure"}
					this.options.document.cookie=this.key+"="+b;
					return this
				},
				read:function(){
					var a=this.options.document.cookie.match("(?:^|;)\\s*"+this.key.escapeRegExp()+"=([^;]*)");
					return(a)?decodeURIComponent(a[1]):null
				},
				dispose:function(){
					new Cookie(this.key,$merge(this.options,{duration:-1})).write("");
					return this
				}
			});
			Cookie.write=function(b,c,a){
				return new Cookie(b,a).write(c)
			};
			Cookie.read=function(a){
				return new Cookie(a).read()
			};
			Cookie.dispose=function(b,a){
				return new Cookie(b,a).dispose()
			};
			Element.Events.domready={
				onAdd:function(a){
					if(Browser.loaded){
						a.call(this)
					}
				}
			};
			(function(){
				var b=function(){
					if(Browser.loaded){return}Browser.loaded=true;
					window.fireEvent("domready");
					document.fireEvent("domready")
				};
				window.addEvent("load",b);
				if(Browser.Engine.trident){
					var a=document.createElement("div");
					(function(){
						($try(function(){
							a.doScroll();
							return document.id(a).inject(document.body).set("html","temp").dispose()
						}))?b():arguments.callee.delay(50)
					})()
				}else{
					if(Browser.Engine.webkit&&Browser.Engine.version<525){
						(function(){
							(["loaded","complete"].contains(document.readyState))?b():arguments.callee.delay(50)
						})()
					}else{
						document.addEvent("DOMContentLoaded",b)
					}
				}
			})();
		Native.implement([Document,Element],{
				getElements:function(j,h){
					j=j.split(",");
					var c,f={};
					for(var d=0,b=j.length;d<b;d++){
						var a=j[d],g=Selectors.Utils.search(this,a,f);
						if(d!=0&&g.item){g=$A(g)}c=(d==0)?g:(c.item)?$A(c).concat(g):c.concat(g)
					}
					return new Elements(c,{ddup:(j.length>1),cash:!h})
				}
			});
		Element.implement({
			match:function(b){
				if(!b||(b==this)){
					return true
				}
				var d=Selectors.Utils.parseTagAndID(b);
				var a=d[0],f=d[1];
				if(!Selectors.Filters.byID(this,f)||!Selectors.Filters.byTag(this,a)){
					return false
				}
				var c=Selectors.Utils.parseSelector(b);
				return(c)?Selectors.Utils.filter(this,c,{}):true
			}
		});
		var Selectors={
			Cache:{
				nth:{},
				parsed:{}
			}
		};
		Selectors.RegExps={
			id:(/#([\w-]+)/),
			tag:(/^(\w+|\*)/),
			quick:(/^(\w+|\*)$/),
			splitter:(/\s*([+>~\s])\s*([a-zA-Z#.*:\[])/g),
			combined:(/\.([\w-]+)|\[(\w+)(?:([!*^$~|]?=)(["']?)([^\4]*?)\4)?\]|:([\w-]+)(?:\(["']?(.*?)?["']?\)|$)/g)
		};
		Selectors.Utils={
			chk:function(b,c){
				if(!c){
					return true
				}
				var a=$uid(b);
				if(!c[a]){
					return c[a]=true
				}
				return false
			},
			parseNthArgument:function(j){
				if(Selectors.Cache.nth[j]){
					return Selectors.Cache.nth[j]
				}
				var f=j.match(/^([+-]?\d*)?([a-z]+)?([+-]?\d*)?$/);
				if(!f){
					return false
				}
				var h=parseInt(f[1],10);
				var d=(h||h===0)?h:1;
				var g=f[2]||false;
				var c=parseInt(f[3],10)||0;
				if(d!=0){
					c--;
					while(c<1){
						c+=d
					}
					while(c>=d){
						c-=d
					}
				}else{
					d=c;g="index"
				}
				switch(g){
					case"n":f={
						a:d,
						b:c,
						special:"n"
					};
					break;
					case"odd":f={
						a:2,
						b:0,
						special:"n"
					};
					break;
					case"even":f={
						a:2,
						b:1,
						special:"n"
					};
					break;
					case"first":f={
						a:0,
						special:"index"
					};
					break;
					case"last":f={
						special:"last-child"
					};
					break;
					case"only":f={
						special:"only-child"
					};
					break;
					default:f={
						a:(d-1),
						special:"index"
					}
				}
				return Selectors.Cache.nth[j]=f
			},
			parseSelector:function(f){
				if(Selectors.Cache.parsed[f]){
					return Selectors.Cache.parsed[f]
				}
				var d,j={
					classes:[],
					pseudos:[],
					attributes:[]
				};
				while((d=Selectors.RegExps.combined.exec(f))){
					var k=d[1],h=d[2],g=d[3],b=d[5],c=d[6],l=d[7];
					if(k){
						j.classes.push(k)
					}else{
						if(c){
							var a=Selectors.Pseudo.get(c);
							if(a){
								j.pseudos.push({
									parser:a,
									argument:l
								})
							}else{
								j.attributes.push({
									name:c,
									operator:"=",
									value:l
								})
							}
						}else{
							if(h){
								j.attributes.push({
									name:h,
									operator:g,
									value:b
								})
							}
						}
					}
				}
				if(!j.classes.length){
					delete j.classes
				}
				if(!j.attributes.length){
					delete j.attributes
				}
				if(!j.pseudos.length){
					delete j.pseudos
				}
				if(!j.classes&&!j.attributes&&!j.pseudos){
					j=null
				}
				return Selectors.Cache.parsed[f]=j
			},
			parseTagAndID:function(b){
				var a=b.match(Selectors.RegExps.tag);
				var c=b.match(Selectors.RegExps.id);
				return[(a)?a[1]:"*",(c)?c[1]:false]
			},
			filter:function(g,c,f){
				var d;
				if(c.classes){
					for(d=c.classes.length;d--;d){
						var h=c.classes[d];
						if(!Selectors.Filters.byClass(g,h)){
							return false
						}
					}
				}
				if(c.attributes){
					for(d=c.attributes.length;d--;d){
						var b=c.attributes[d];
						if(!Selectors.Filters.byAttribute(g,b.name,b.operator,b.value)){
							return false
						}
					}
				}
				if(c.pseudos){
					for(d=c.pseudos.length;d--;d){
						var a=c.pseudos[d];
						if(!Selectors.Filters.byPseudo(g,a.parser,a.argument,f)){
							return false
						}
					}
				}
				return true
			},
			getByTagAndID:function(b,a,d){
				if(d){
					var c=(b.getElementById)?b.getElementById(d,true):Element.getElementById(b,d,true);
					return(c&&Selectors.Filters.byTag(c,a))?[c]:[]
				}else{
					return b.getElementsByTagName(a)
				}
			},
			search:function(q,o,v){
				var b=[];
				var c=o.trim().replace(Selectors.RegExps.splitter,function(l,k,j){
					b.push(k);
					return":)"+j
				}).split(":)");
				var r,f,C;
				for(var B=0,x=c.length;B<x;B++){
					var A=c[B];
					if(B==0&&Selectors.RegExps.quick.test(A)){
						r=q.getElementsByTagName(A);
						continue
					}
					var a=b[B-1];
					var s=Selectors.Utils.parseTagAndID(A);
					var D=s[0],t=s[1];
					if(B==0){
						r=Selectors.Utils.getByTagAndID(q,D,t)
					}else{
						var d={},h=[];
						for(var z=0,y=r.length;z<y;z++){
							h=Selectors.Getters[a](h,r[z],D,t,d)
						}
						r=h
					}
					var g=Selectors.Utils.parseSelector(A);
					if(g){
						f=[];
						for(var w=0,u=r.length;w<u;w++){
							C=r[w];
							if(Selectors.Utils.filter(C,g,v)){
								f.push(C)
							}
						}
						r=f
					}
				}
				return r
			}
		};
		Selectors.Getters={
			" ":function(j,h,k,a,f){
				var d=Selectors.Utils.getByTagAndID(h,k,a);
				for(var c=0,b=d.length;c<b;c++){
					var g=d[c];
					if(Selectors.Utils.chk(g,f)){
						j.push(g)
					}
				}
				return j
			},
			">":function(j,h,k,a,g){
				var c=Selectors.Utils.getByTagAndID(h,k,a);
				for(var f=0,d=c.length;f<d;f++){
					var b=c[f];
					if(b.parentNode==h&&Selectors.Utils.chk(b,g)){
						j.push(b)
					}
				}
				return j
			},
			"+":function(c,b,a,f,d){
				while((b=b.nextSibling)){
					if(b.nodeType==1){
						if(Selectors.Utils.chk(b,d)&&Selectors.Filters.byTag(b,a)&&Selectors.Filters.byID(b,f)){
							c.push(b)
						}
						break
					}
				}
				return c
			},
			"~":function(c,b,a,f,d){
				while((b=b.nextSibling)){
					if(b.nodeType==1){
						if(!Selectors.Utils.chk(b,d)){
							break
						}
						if(Selectors.Filters.byTag(b,a)&&Selectors.Filters.byID(b,f)){
							c.push(b)
						}
					}
				}
				return c
			}
		};
		Selectors.Filters={
			byTag:function(b,a){
				return(a=="*"||(b.tagName&&b.tagName.toLowerCase()==a))
			},
			byID:function(a,b){
				return(!b||(a.id&&a.id==b))
			},
			byClass:function(b,a){
				return(b.className&&b.className.contains&&b.className.contains(a," "))
			},
			byPseudo:function(a,d,c,b){
				return d.call(a,c,b)
			},
			byAttribute:function(c,d,b,f){
				var a=Element.prototype.getProperty.call(c,d);
				if(!a){
					return(b=="!=")
				}
				if(!b||f==undefined){
					return true
				}
				switch(b){
					case"=":return(a==f);
					case"*=":return(a.contains(f));
					case"^=":return(a.substr(0,f.length)==f);
					case"$=":return(a.substr(a.length-f.length)==f);
					case"!=":return(a!=f);
					case"~=":return a.contains(f," ");
					case"|=":return a.contains(f,"-")
				}
				return false
			}
		};
		Selectors.Pseudo=new Hash({
			checked:function(){
				return this.checked
			},
			empty:function(){
				return !(this.innerText||this.textContent||"").length
			},
			not:function(a){
				return !Element.match(this,a)
			},
			contains:function(a){
				return(this.innerText||this.textContent||"").contains(a)
			},
			"first-child":function(){
				return Selectors.Pseudo.index.call(this,0)
			},
			"last-child":function(){
				var a=this;while((a=a.nextSibling)){
					if(a.nodeType==1){
						return false
					}
				}
				return true
			},
			"only-child":function(){
				var b=this;
				while((b=b.previousSibling)){
					if(b.nodeType==1){
						return false
					}
				}
				var a=this;
				while((a=a.nextSibling)){
					if(a.nodeType==1){
						return false
					}
				}
				return true
			},
			"nth-child":function(h,f){
				h=(h==undefined)?"n":h;
				var c=Selectors.Utils.parseNthArgument(h);
				if(c.special!="n"){
					return Selectors.Pseudo[c.special].call(this,c.a,f)
				}
				var g=0;
				f.positions=f.positions||{};
				var d=$uid(this);
				if(!f.positions[d]){
					var b=this;
					while((b=b.previousSibling)){
						if(b.nodeType!=1){
							continue
						}
						g++;
						var a=f.positions[$uid(b)];
						if(a!=undefined){
							g=a+g;
							break
						}
					}
					f.positions[d]=g
				}
				return(f.positions[d]%c.a==c.b)
			},
			index:function(a){
				var b=this,c=0;
				while((b=b.previousSibling)){
					if(b.nodeType==1&&++c>a){
						return false
					}
				}
				return(c==a)
			},
			even:function(b,a){
				return Selectors.Pseudo["nth-child"].call(this,"2n+1",a)
			},
			odd:function(b,a){
				return Selectors.Pseudo["nth-child"].call(this,"2n",a)
			},
			selected:function(){
				return this.selected
			},
			enabled:function(){
				return(this.disabled===false)
			}
		});
		var Swiff=new Class({
			Implements:[Options],
			options:{
				id:null,
				height:1,
				width:1,
				container:null,
				properties:{},
				params:{
					quality:"high",
					allowScriptAccess:"always",
					wMode:"transparent",
					swLiveConnect:true
				},
				callBacks:{},
				vars:{}
			},
			toElement:function(){
				return this.object
			},
			initialize:function(n,o){
				this.instance="Swiff_"+$time();
				this.setOptions(o);
				o=this.options;
				var b=this.id=o.id||this.instance;
				var a=document.id(o.container);
				Swiff.CallBacks[this.instance]={};
				var f=o.params,h=o.vars,g=o.callBacks;
				var j=$extend({
					height:o.height,
					width:o.width
				},o.properties);
				var m=this;
				for(var d in g){
					Swiff.CallBacks[this.instance][d]=(function(q){
						return function(){
							return q.apply(m.object,arguments)
						}
					})(g[d]);
					h[d]="Swiff.CallBacks."+this.instance+"."+d
				}
				f.flashVars=Hash.toQueryString(h);
				if(Browser.Engine.trident){
					j.classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000";
					f.movie=n
				}else{
					j.type="application/x-shockwave-flash";
					j.data=n
				}
				var l='<object id="'+b+'"';
				for(var k in j){
					l+=" "+k+'="'+j[k]+'"'
				}
				l+=">";
				for(var c in f){
					if(f[c]){
						l+='<param name="'+c+'" value="'+f[c]+'" />'
					}
				}
				l+="</object>";
				this.object=((a)?a.empty():new Element("div")).set("html",l).firstChild
			},
			replaces:function(a){
				a=document.id(a,true);
				a.parentNode.replaceChild(this.toElement(),a);
				return this
			},
			inject:function(a){
				document.id(a,true).appendChild(this.toElement());
				return this
			},
			remote:function(){
				return Swiff.remote.apply(Swiff,[this.toElement()].extend(arguments))
			}
		});
		Swiff.CallBacks={};
		Swiff.remote=function(obj,fn){
			var rs=obj.CallFunction('<invoke name="'+fn+'" returntype="javascript">'+__flash__argumentsToXML(arguments,2)+"</invoke>");
			return eval(rs)
		};
		MooTools.More={
			version:"1.2.4.4",
			build:"6f6057dc645fdb7547689183b2311063bd653ddf"
		};
		(function(){
			var a={
				language:"en-US",
				languages:{
					"en-US":{}
				},
				cascades:["en-US"]
			};
			var b;
			MooTools.lang=new Events();
			$extend(MooTools.lang,{
				setLanguage:function(c){
					if(!a.languages[c]){
						return this
					}
					a.language=c;
					this.load();
					this.fireEvent("langChange",c);
					return this
				},
				load:function(){
					var c=this.cascade(this.getCurrentLanguage());
					b={};
					$each(c,function(f,d){
						b[d]=this.lambda(f)
					},this)
				},
				getCurrentLanguage:function(){
					return a.language
				},
				addLanguage:function(c){
					a.languages[c]=a.languages[c]||{};
					return this
				},
				cascade:function(f){
					var c=(a.languages[f]||{}).cascades||[];
					c.combine(a.cascades);
					c.erase(f).push(f);
					var d=c.map(function(g){
						return a.languages[g]
					},this);
					return $merge.apply(this,d)
				},
				lambda:function(c){
					(c||{}).get=function(f,d){
						return $lambda(c[f]).apply(this,$splat(d))
					};
					return c
				},
				get:function(f,d,c){
					if(b&&b[f]){
						return(d?b[f].get(d,c):b[f])
					}
				},
				set:function(d,f,c){
					this.addLanguage(d);
					langData=a.languages[d];
					if(!langData[f]){
						langData[f]={}
					}
					$extend(langData[f],c);
					if(d==this.getCurrentLanguage()){
						this.load();
						this.fireEvent("langChange",d)
					}
					return this
				},
				list:function(){
					return Hash.getKeys(a.languages)
				}
			})
		})();
		Class.refactor=function(b,a){
			$each(a,function(f,d){
				var c=b.prototype[d];
				if(c&&(c=c._origin)&&typeof f=="function"){
					b.implement(d,function(){
						var g=this.previous;
						this.previous=c;
						var h=f.apply(this,arguments);
						this.previous=g;
						return h
					})
				}else{
					b.implement(d,f)
				}
			});
			return b
		};
		Class.Mutators.Binds=function(a){
			return a
		};
		Class.Mutators.initialize=function(a){
			return function(){
				$splat(this.Binds).each(function(b){
					var c=this[b];
					if(c){
						this[b]=c.bind(this)
					}
				},this);
				return a.apply(this,arguments)
			}
		};
		Class.Occlude=new Class({
			occlude:function(c,b){
				b=document.id(b||this.element);
				var a=b.retrieve(c||this.property);
				if(a&&!$defined(this.occluded)){
					return this.occluded=a
				}
				this.occluded=false;
				b.store(c||this.property,this);
				return this.occluded
			}
		});
		Array.implement({
			min:function(){
				return Math.min.apply(null,this)
			},
			max:function(){
				return Math.max.apply(null,this)
			},
			average:function(){
				return this.length?this.sum()/this.length:0
			},
			sum:function(){
				var a=0,b=this.length;if(b){
					do{
						a+=this[--b]
					}
					while(b)
				}
				return a
			},
			unique:function(){
				return[].combine(this)
			},
			shuffle:function(){
				for(var b=this.length;b&&--b;){
					var a=this[b],c=Math.floor(Math.random()*(b+1));
					this[b]=this[c];
					this[c]=a
				}
				return this
			}
		});
		Hash.implement({
			getFromPath:function(a){
				var b=this.getClean();
				a.replace(/\[([^\]]+)\]|\.([^.[]+)|[^[.]+/g,
					function(c){
						if(!b){
							return null
						}
						var d=arguments[2]||arguments[1]||arguments[0];
						b=(d in b)?b[d]:null;
						return c
					});
				return b
			},
			cleanValues:function(a){
				a=a||$defined;
				this.each(function(c,b){
					if(!a(c)){
						this.erase(b)
					}
				},this);
				return this
			},
			run:function(){
				var a=arguments;
				this.each(function(c,b){
					if($type(c)=="function"){
						c.run(a)
					}
				})
			}
		});
		(function(){
			var b=["Ã€","Ã ","Ã","Ã¡","Ã‚","Ã¢","Ãƒ","Ã£","Ã„","Ã¤","Ã…","Ã¥","Ä‚","Äƒ","Ä„","Ä…","Ä†","Ä‡","ÄŒ","Ä","Ã‡","Ã§","ÄŽ","Ä","Ä","Ä‘","Ãˆ","Ã¨","Ã‰","Ã©","ÃŠ","Ãª","Ã‹","Ã«","Äš","Ä›","Ä˜","Ä™","Äž","ÄŸ","ÃŒ","Ã¬","Ã","Ã­","ÃŽ","Ã®","Ã","Ã¯","Ä¹","Äº","Ä½","Ä¾","Å","Å‚","Ã‘","Ã±","Å‡","Åˆ","Åƒ","Å„","Ã’","Ã²","Ã“","Ã³","Ã”","Ã´","Ã•","Ãµ","Ã–","Ã¶","Ã˜","Ã¸","Å‘","Å˜","Å™","Å”","Å•","Å ","Å¡","Åž","ÅŸ","Åš","Å›","Å¤","Å¥","Å¤","Å¥","Å¢","Å£","Ã™","Ã¹","Ãš","Ãº","Ã›","Ã»","Ãœ","Ã¼","Å®","Å¯","Å¸","Ã¿","Ã½","Ã","Å½","Å¾","Å¹","Åº","Å»","Å¼","Ãž","Ã¾","Ã","Ã°","ÃŸ","Å’","Å“","Ã†","Ã¦","Âµ"];

			var a=["A","a","A","a","A","a","A","a","Ae","ae","A","a","A","a","A","a","C","c","C","c","C","c","D","d","D","d","E","e","E","e","E","e","E","e","E","e","E","e","G","g","I","i","I","i","I","i","I","i","L","l","L","l","L","l","N","n","N","n","N","n","O","o","O","o","O","o","O","o","Oe","oe","O","o","o","R","r","R","r","S","s","S","s","S","s","T","t","T","t","T","t","U","u","U","u","U","u","Ue","ue","U","u","Y","y","Y","y","Z","z","Z","z","Z","z","TH","th","DH","dh","ss","OE","oe","AE","ae","u"];
			var d={
				"[\xa0\u2002\u2003\u2009]":" ",
				"\xb7":"*",
				"[\u2018\u2019]":"'",
				"[\u201c\u201d]":'"',
				"\u2026":"...",
				"\u2013":"-",
				"\u2014":"--",
				"\uFFFD":"&raquo;"
			};
			var c=function(f,g){
				f=f||"";
				var h=g?"<"+f+"[^>]*>([\\s\\S]*?)</"+f+">":"</?"+f+"([^>]+)?>";
				reg=new RegExp(h,"gi");
				return reg
			};
			String.implement({
				standardize:function(){
					var f=this;
					b.each(function(h,g){
						f=f.replace(new RegExp(h,"g"),a[g])
					});
					return f
				},
				repeat:function(f){
					return new Array(f+1).join(this)
				},
				pad:function(g,j,f){
					if(this.length>=g){
						return this
					}
					var h=(j==null?" ":""+j).repeat(g-this.length).substr(0,g-this.length);
					if(!f||f=="right"){
						return this+h
					}
					if(f=="left"){
						return h+this
					}
					return h.substr(0,(h.length/2).floor())+this+h.substr(0,(h.length/2).ceil())
				},
				getTags:function(f,g){
					return this.match(c(f,g))||[]
				},
				stripTags:function(f,g){
					return this.replace(c(f,g),"")
				},
				tidy:function(){
					var f=this.toString();
					$each(d,function(h,g){
						f=f.replace(new RegExp(g,"g"),h)
					});
					return f
				}
			})
		})();
		String.implement({
			parseQueryString:function(){
				var b=this.split(/[&;]/),a={};
				if(b.length){
					b.each(function(h){
						var c=h.indexOf("="),d=c<0?[""]:h.substr(0,c).match(/[^\]\[]+/g),f=decodeURIComponent(h.substr(c+1)),g=a;
						d.each(function(k,j){
							var l=g[k];
							if(j<d.length-1){
								g=g[k]=l||{}
							}else{
								if($type(l)=="array"){
									l.push(f)
								}else{
									g[k]=$defined(l)?[l,f]:f
								}
							}
						})
					})
				}
				return a
			},
			cleanQueryString:function(a){
				return this.split("&").filter(function(f){
					var b=f.indexOf("="),c=b<0?"":f.substr(0,b),d=f.substr(b+1);
					return a?a.run([c,d]):$chk(d)
				}).join("&")
			}
		});
		var URI=new Class({
			Implements:Options,
			options:{},
			regex:/^(?:(\w+):)?(?:\/\/(?:(?:([^:@\/]*):?([^:@\/]*))?@)?([^:\/?#]*)(?::(\d*))?)?(\.\.?$|(?:[^?#\/]*\/)*)([^?#]*)(?:\?([^#]*))?(?:#(.*))?/,
			parts:["scheme","user","password","host","port","directory","file","query","fragment"],
			schemes:{
				http:80,
				https:443,
				ftp:21,
				rtsp:554,
				mms:1755,
				file:0
			},
			initialize:function(b,a){
				this.setOptions(a);
				var c=this.options.base||URI.base;
				if(!b){
					b=c
				}
				if(b&&b.parsed){
					this.parsed=$unlink(b.parsed)
				}else{
					this.set("value",b.href||b.toString(),c?new URI(c):false)
				}
			},
			parse:function(c,b){
				var a=c.match(this.regex);
				if(!a){
					return false
				}
				a.shift();
				return this.merge(a.associate(this.parts),b)
			},
			merge:function(b,a){
				if((!b||!b.scheme)&&(!a||!a.scheme)){
					return false
				}
				if(a){
					this.parts.every(function(c){
						if(b[c]){
							return false
						}
						b[c]=a[c]||"";
						return true
					})
				}
				b.port=b.port||this.schemes[b.scheme.toLowerCase()];
				b.directory=b.directory?this.parseDirectory(b.directory,a?a.directory:""):"/";
				return b
			},
			parseDirectory:function(b,c){
				b=(b.substr(0,1)=="/"?"":(c||"/"))+b;
				if(!b.test(URI.regs.directoryDot)){
					return b
				}
				var a=[];
				b.replace(URI.regs.endSlash,"").split("/").each(function(d){
					if(d==".."&&a.length>0){
						a.pop()
					}else{
						if(d!="."){
							a.push(d)
						}
					}
				});
				return a.join("/")+"/"},combine:function(a){
					return a.value||a.scheme+"://"+(a.user?a.user+(a.password?":"+a.password:"")+"@":"")+(a.host||"")+(a.port&&a.port!=this.schemes[a.scheme]?":"+a.port:"")+(a.directory||"/")+(a.file||"")+(a.query?"?"+a.query:"")+(a.fragment?"#"+a.fragment:"")
				},
				set:function(b,d,c){
					if(b=="value"){
						var a=d.match(URI.regs.scheme);
						if(a){
							a=a[1]
						}
						if(a&&!$defined(this.schemes[a.toLowerCase()])){
							this.parsed={
								scheme:a,
								value:d
							}
						}else{
							this.parsed=this.parse(d,(c||this).parsed)||(a?{
								scheme:a,
								value:d
							}:{
								value:d
							})
						}
					}else{
						if(b=="data"){
							this.setData(d)
						}else{
							this.parsed[b]=d
						}
					}
					return this
				},
				get:function(a,b){
					switch(a){
						case"value":return this.combine(this.parsed,b?b.parsed:false);
						case"data":return this.getData()
					}
					return this.parsed[a]||""
				},
				go:function(){
					document.location.href=this.toString()
				},
				toURI:function(){
					return this
				},
				getData:function(c,b){
					var a=this.get(b||"query");
					if(!$chk(a)){
						return c?null:{}
					}
					var d=a.parseQueryString();
					return c?d[c]:d
				},
				setData:function(a,c,b){
					if(typeof a=="string"){
						data=this.getData();
						data[arguments[0]]=arguments[1];
						a=data
					}else{
						if(c){
							a=$merge(this.getData(),a)
						}
					}
					return this.set(b||"query",Hash.toQueryString(a))
				},
				clearData:function(a){
					return this.set(a||"query","")
				}
			});
		URI.prototype.toString=URI.prototype.valueOf=function(){
			return this.get("value")
		};
		URI.regs={
			endSlash:/\/$/,
			scheme:/^(\w+):/,
			directoryDot:/\.\/|\.$/};
			URI.base=new URI(document.getElements("base[href]",true).getLast(),{
				base:document.location
			});
			String.implement({
				toURI:function(a){
					return new URI(this,a)
				}
			});
			Element.implement({
				tidy:function(){
					this.set("value",this.get("value").tidy())
				},
				getTextInRange:function(b,a){
					return this.get("value").substring(b,a)
				},
				getSelectedText:function(){
					if(this.setSelectionRange){
						return this.getTextInRange(this.getSelectionStart(),this.getSelectionEnd())
					}
					return document.selection.createRange().text
				},
				getSelectedRange:function(){
					if($defined(this.selectionStart)){
						return{
							start:this.selectionStart,
							end:this.selectionEnd
						}
					}
					var f={
						start:0,
						end:0
					};
					var a=this.getDocument().selection.createRange();
					if(!a||a.parentElement()!=this){
						return f
					}
					var c=a.duplicate();
					if(this.type=="text"){
						f.start=0-c.moveStart("character",-100000);
						f.end=f.start+a.text.length
					}else{
						var b=this.get("value");
						var d=b.length;
						c.moveToElementText(this);
						c.setEndPoint("StartToEnd",a);
						if(c.text.length){
							d-=b.match(/[\n\r]*$/)[0].length
						}
						f.end=d-c.text.length;
						c.setEndPoint("StartToStart",a);
						f.start=d-c.text.length
					}
					return f
				},
				getSelectionStart:function(){
					return this.getSelectedRange().start
				},
				getSelectionEnd:function(){
					return this.getSelectedRange().end
				},
				setCaretPosition:function(a){
					if(a=="end"){
						a=this.get("value").length
					}
					this.selectRange(a,a);
					return this
				},
				getCaretPosition:function(){
					return this.getSelectedRange().start
				},
				selectRange:function(f,a){
					if(this.setSelectionRange){
						this.focus();
						this.setSelectionRange(f,a)
					}else{
						var c=this.get("value");
						var d=c.substr(f,a-f).replace(/\r/g,"").length;
						f=c.substr(0,f).replace(/\r/g,"").length;
						var b=this.createTextRange();
						b.collapse(true);
						b.moveEnd("character",f+d);
						b.moveStart("character",f);
						b.select()
					}
					return this
				},
				insertAtCursor:function(b,a){
					var d=this.getSelectedRange();
					var c=this.get("value");
					this.set("value",c.substring(0,d.start)+b+c.substring(d.end,c.length));
					if($pick(a,true)){
						this.selectRange(d.start,d.start+b.length)
					}else{
						this.setCaretPosition(d.start+b.length)
					}
					return this
				},
				insertAroundCursor:function(b,a){
					b=$extend({
						before:"",
						defaultMiddle:"",
						after:""
					},b);
					var c=this.getSelectedText()||b.defaultMiddle;
					var h=this.getSelectedRange();
					var g=this.get("value");
					if(h.start==h.end){
						this.set("value",g.substring(0,h.start)+b.before+c+b.after+g.substring(h.end,g.length));
						this.selectRange(h.start+b.before.length,h.end+b.before.length+c.length)
					}else{
						var d=g.substring(h.start,h.end);
						this.set("value",g.substring(0,h.start)+b.before+d+b.after+g.substring(h.end,g.length));
						var f=h.start+b.before.length;
						if($pick(a,true)){
							this.selectRange(f,f+d.length)
						}else{
							this.setCaretPosition(f+g.length)
						}
					}
					return this
				}
			});
			Elements.from=function(f,d){
				if($pick(d,true)){
					f=f.stripScripts()
				}
				var b,c=f.match(/^\s*<(t[dhr]|tbody|tfoot|thead)/i);
				if(c){
					b=new Element("table");
					var a=c[1].toLowerCase();
					if(["td","th","tr"].contains(a)){
						b=new Element("tbody").inject(b);
						if(a!="tr"){
							b=new Element("tr").inject(b)
						}
					}
				}
				return(b||new Element("div")).set("html",f).getChildren()
			};
			Element.implement({
				measure:function(f){
					var h=function(j){
						return !!(!j||j.offsetHeight||j.offsetWidth)
					};
					if(h(this)){
						return f.apply(this)
					}
					var d=this.getParent(),g=[],b=[];
					while(!h(d)&&d!=document.body){
						b.push(d.expose());
						d=d.getParent()
					}
					var c=this.expose();
					var a=f.apply(this);
					c();
					b.each(function(j){
						j()
					});
					return a
				},
				expose:function(){
					if(this.getStyle("display")!="none"){
						return $empty
					}
					var a=this.style.cssText;
					this.setStyles({
						display:"block",
						position:"absolute",
						visibility:"hidden"
					});
					return function(){
						this.style.cssText=a
					}.bind(this)
				},
				getDimensions:function(a){
					a=$merge({
						computeSize:false
					},a);
					var f={};
					var d=function(h,g){
						return(g.computeSize)?h.getComputedSize(g):h.getSize()
					};
					var b=this.getParent("body");
					if(b&&this.getStyle("display")=="none"){
						f=this.measure(function(){
							return d(this,a)
						})
					}else{
						if(b){
							try{
								f=d(this,a)
							}
							catch(c){}
						}else{
							f={
								x:0,
								y:0
							}
						}
					}
					return $chk(f.x)?$extend(f,{width:f.x,height:f.y}):$extend(f,{x:f.width,y:f.height})},
					getComputedSize:function(a){
						a=$merge({
							styles:["padding","border"],
							plains:{
								height:["top","bottom"],
								width:["left","right"]
							},
							mode:"both"
						},a);
						var c={width:0,height:0};
						switch(a.mode){
							case"vertical":delete c.width;
							delete a.plains.width;
							break;
							case"horizontal":delete c.height;
							delete a.plains.height;
							break
						}
						var b=[];
						$each(a.plains,function(h,g){
							h.each(function(j){
								a.styles.each(function(k){
									b.push((k=="border")?k+"-"+j+"-width":k+"-"+j)
								})
							})
						});
						var f={};
						b.each(function(g){
							f[g]=this.getComputedStyle(g)
						},this);
						var d=[];
						$each(a.plains,function(h,g){
							var j=g.capitalize();
							c["total"+j]=c["computed"+j]=0;
							h.each(function(k){
								c["computed"+k.capitalize()]=0;
								b.each(function(m,l){
									if(m.test(k)){
										f[m]=f[m].toInt()||0;
										c["total"+j]=c["total"+j]+f[m];
										c["computed"+k.capitalize()]=c["computed"+k.capitalize()]+f[m]
									}
									if(m.test(k)&&g!=m&&(m.test("border")||m.test("padding"))&&!d.contains(m)){
										d.push(m);
										c["computed"+j]=c["computed"+j]-f[m]
									}
								})
							})
						});
						["Width","Height"].each(function(h){
							var g=h.toLowerCase();
							if(!$chk(c[g])){
								return
							}
							c[g]=c[g]+this["offset"+h]+c["computed"+h];
							c["total"+h]=c[g]+c["total"+h];
							delete c["computed"+h]},this);
							return $extend(f,c)
						}
					});
			(function(){
				var a=Element.prototype.position;Element.implement({
					position:function(h){
						if(h&&($defined(h.x)||$defined(h.y))){
							return a?a.apply(this,arguments):this
						}
						$each(h||{},
						function(x,w){
							if(!$defined(x)){
								delete h[w]
							}
						});
						h=$merge({
							relativeTo:document.body,
							position:{
								x:"center",
								y:"center"
							},
							edge:false,
							offset:{
								x:0,
								y:0
							},
							returnPos:false,
							relFixedPosition:false,
							ignoreMargins:false,
							ignoreScroll:false,
							allowNegative:false
						},h);
						var u={
							x:0,
							y:0
						},
						f=false;
						var c=this.measure(function(){
							return document.id(this.getOffsetParent())
						});
						if(c&&c!=this.getDocument().body){
							u=c.measure(function(){
								return this.getPosition()
							});
							f=c!=document.id(h.relativeTo);
							h.offset.x=h.offset.x-u.x;
							h.offset.y=h.offset.y-u.y
						}
						var v=function(w){
							if($type(w)!="string"){
								return w
							}
							w=w.toLowerCase();
							var x={};
							if(w.test("left")){
								x.x="left"
							}else{
								if(w.test("right")){
									x.x="right"
								}else{
									x.x="center"
								}
							}
							if(w.test("upper")||w.test("top")){
								x.y="top"
							}else{
								if(w.test("bottom")){
									x.y="bottom"
								}else{
									x.y="center"
								}
							}
							return x
						};
						h.edge=v(h.edge);
						h.position=v(h.position);
						if(!h.edge){
							if(h.position.x=="center"&&h.position.y=="center"){
								h.edge={
									x:"center",
									y:"center"
								}
							}else{
								h.edge={
									x:"left",
									y:"top"
								}
							}
						}
						this.setStyle("position","absolute");
						var g=document.id(h.relativeTo)||document.body,d=g==document.body?window.getScroll():g.getPosition(),n=d.y,j=d.x;
						var q=this.getDimensions({
							computeSize:true,
							styles:["padding","border","margin"]
						});
						var l={},r=h.offset.y,t=h.offset.x,m=window.getSize();
						switch(h.position.x){
							case"left":l.x=j+t;
							break;
							case"right":l.x=j+t+g.offsetWidth;
							break;
							default:l.x=j+((g==document.body?m.x:g.offsetWidth)/2)+t;
							break
						}
						switch(h.position.y){
							case"top":l.y=n+r;
							break;
							case"bottom":l.y=n+r+g.offsetHeight;
							break;
							default:l.y=n+((g==document.body?m.y:g.offsetHeight)/2)+r;
							break
						}
						if(h.edge){
							var b={};
							switch(h.edge.x){
								case"left":b.x=0;
								break;
								case"right":b.x=-q.x-q.computedRight-q.computedLeft;
								break;
								default:b.x=-(q.totalWidth/2);
								break
							}
							switch(h.edge.y){
								case"top":b.y=0;
								break;
								case"bottom":b.y=-q.y-q.computedTop-q.computedBottom;
								break;
								default:b.y=-(q.totalHeight/2);
								break
							}
							l.x+=b.x;
							l.y+=b.y
						}
						l={
							left:((l.x>=0||f||h.allowNegative)?l.x:0).toInt(),
							top:((l.y>=0||f||h.allowNegative)?l.y:0).toInt()
						};
						var k={
							left:"x",
							top:"y"
						};
						["minimum","maximum"].each(function(w){
							["left","top"].each(function(x){
								var y=h[w]?h[w][k[x]]:null;
								if(y!=null&&l[x]<y){
									l[x]=y
								}
							})
						});
						if(g.getStyle("position")=="fixed"||h.relFixedPosition){
							var o=window.getScroll();
							l.top+=o.y;
							l.left+=o.x
						}
						if(h.ignoreScroll){
							var s=g.getScroll();
							l.top-=s.y;
							l.left-=s.x
						}
						if(h.ignoreMargins){
							l.left+=(h.edge.x=="right"?q["margin-right"]:h.edge.x=="center"?-q["margin-left"]+((q["margin-right"]+q["margin-left"])/2):-q["margin-left"]);
							l.top+=(h.edge.y=="bottom"?q["margin-bottom"]:h.edge.y=="center"?-q["margin-top"]+((q["margin-bottom"]+q["margin-top"])/2):-q["margin-top"])
						}
						l.left=Math.ceil(l.left);
						l.top=Math.ceil(l.top);
						if(h.returnPos){
							return l
						}else{
							this.setStyles(l)
						}
						return this
					}
				})
			})();
			Element.implement({
				isDisplayed:function(){
					return this.getStyle("display")!="none"
				},
				isVisible:function(){
					var a=this.offsetWidth,b=this.offsetHeight;
					return(a==0&&b==0)?false:(a>0&&b>0)?true:this.isDisplayed()
				},
				toggle:function(){
					return this[this.isDisplayed()?"hide":"show"]()
				},
				hide:function(){
					var b;
					try{
						b=this.getStyle("display")
					}
					catch(a){}
					return this.store("originalDisplay",b||"").setStyle("display","none")
				},
				show:function(a){
					a=a||this.retrieve("originalDisplay")||"block";
					return this.setStyle("display",(a=="none")?"block":a)
				},
				swapClass:function(a,b){
					return this.removeClass(a).addClass(b)
				}
			});
			var OverText=new Class({
				Implements:[Options,Events,Class.Occlude],
				Binds:["reposition","assert","focus","hide"],
				options:{
					element:"label",
					positionOptions:{
						position:"upperLeft",
						edge:"upperLeft",
						offset:{
							x:4,
							y:2
						}
					},
					poll:false,
					pollInterval:250,
					wrap:false
				},
				property:"OverText",
				initialize:function(b,a){
					this.element=document.id(b);
					if(this.occlude()){
						return this.occluded
					}
					this.setOptions(a);
					this.attach(this.element);
					OverText.instances.push(this);
					if(this.options.poll){
						this.poll()
					}
					return this
				},
				toElement:function(){
					return this.element
				},
				attach:function(){
					var a=this.options.textOverride||this.element.get("alt")||this.element.get("title");
					if(!a){
						return
					}
					this.text=new Element(this.options.element,{
						"class":"overTxtLabel",
						styles:{
							lineHeight:"normal",
							position:"absolute",
							cursor:"text"
						},
						html:a,
						events:{
							click:this.hide.pass(this.options.element=="label",this)
						}
					}).inject(this.element,"after");
					if(this.options.element=="label"){
						if(!this.element.get("id")){
							this.element.set("id","input_"+new Date().getTime())
						}
						this.text.set("for",this.element.get("id"))
					}
					if(this.options.wrap){
						this.textHolder=new Element("div",{
							styles:{
								lineHeight:"normal",
								position:"relative"
							},
							"class":"overTxtWrapper"
						}).adopt(this.text).inject(this.element,"before")
					}
					this.element.addEvents({
						focus:this.focus,
						blur:this.assert,
						change:this.assert
					}).store("OverTextDiv",this.text);
					window.addEvent("resize",this.reposition.bind(this));
					this.assert(true);
					this.reposition()
				},
				wrap:function(){
					if(this.options.element=="label"){
						if(!this.element.get("id")){
							this.element.set("id","input_"+new Date().getTime())
						}
						this.text.set("for",this.element.get("id"))
					}
				},
				startPolling:function(){
					this.pollingPaused=false;
					return this.poll()
				},
				poll:function(a){
					if(this.poller&&!a){
						return this
					}
					var b=function(){
						if(!this.pollingPaused){
							this.assert(true)
						}
					}.bind(this);
					if(a){
						$clear(this.poller)
					}else{
						this.poller=b.periodical(this.options.pollInterval,this)
					}
					return this
				},
				stopPolling:function(){
					this.pollingPaused=true;
					return this.poll(true)
				},
				focus:function(){
					if(this.text&&(!this.text.isDisplayed()||this.element.get("disabled"))){
						return
					}
					this.hide()
				},
				hide:function(c,a){
					if(this.text&&(this.text.isDisplayed()&&(!this.element.get("disabled")||a))){
						this.text.hide();
						this.fireEvent("textHide",[this.text,this.element]);
						this.pollingPaused=true;
						if(!c){
							try{
								this.element.fireEvent("focus");
								this.element.focus()
							}
							catch(b){}
						}
					}
					return this
				},
				show:function(){
					if(this.text&&!this.text.isDisplayed()){
						this.text.show();
						this.reposition();
						this.fireEvent("textShow",[this.text,this.element]);
						this.pollingPaused=false
					}
					return this
				},
				assert:function(a){
					this[this.test()?"show":"hide"](a)
				},
				test:function(){
					var a=this.element.get("value");
					return !a
				},
				reposition:function(){
					this.assert(true);
					if(!this.element.isVisible()){
						return this.stopPolling().hide()
					}
					if(this.text&&this.test()){
						this.text.position($merge(this.options.positionOptions,{
							relativeTo:this.element
						}))
					}
					return this
				}
			});
			OverText.instances=[];
			$extend(OverText,{
				each:function(a){
					return OverText.instances.map(function(c,b){
						if(c.element&&c.text){
							return a.apply(OverText,[c,b])
						}
						return null
					})
				},
				update:function(){
					return OverText.each(function(a){
						return a.reposition()
					})
				},
				hideAll:function(){
					return OverText.each(function(a){
						return a.hide(true,true)
					})
				},
				showAll:function(){
					return OverText.each(function(a){
						return a.show()
					})
				}
			});
			if(window.Fx&&Fx.Reveal){
				Fx.Reveal.implement({
					hideInputs:Browser.Engine.trident?"select, input, textarea, object, embed, .overTxtLabel":false
				})
			}
			Fx.Elements=new Class({
				Extends:Fx.CSS,
				initialize:function(b,a){
					this.elements=this.subject=$$(b);
					this.parent(a)
				},
				compute:function(h,j,k){
					var c={};
					for(var d in h){
						var a=h[d],f=j[d],g=c[d]={};
						for(var b in a){
							g[b]=this.parent(a[b],f[b],k)
						}
					}
					return c
				},
				set:function(b){
					for(var c in b){
						var a=b[c];
						for(var d in a){
							this.render(this.elements[c],d,a[d],this.options.unit)
						}
					}
					return this
				},
				start:function(c){
					if(!this.check(c)){
						return this
					}
					var j={},k={};
					for(var d in c){
						var g=c[d],a=j[d]={},h=k[d]={};
						for(var b in g){
							var f=this.prepare(this.elements[d],b,g[b]);
							a[b]=f.from;
							h[b]=f.to
						}
					}
					return this.parent(j,k)
				}
			});
			Fx.Accordion=new Class({
				Extends:Fx.Elements,
				options:{
					display:0,
					show:false,
					height:true,
					width:false,
					opacity:true,
					alwaysHide:false,
					trigger:"click",
					initialDisplayFx:true,
					returnHeightToAuto:true
				},
				initialize:function(){
					var c=Array.link(arguments,{
						container:Element.type,
						options:Object.type,
						togglers:$defined,
						elements:$defined
					});
					this.parent(c.elements,c.options);
					this.togglers=$$(c.togglers);
					this.previous=-1;
					this.internalChain=new Chain();
					if(this.options.alwaysHide){
						this.options.wait=true
					}
					if($chk(this.options.show)){
						this.options.display=false;
						this.previous=this.options.show
					}
					if(this.options.start){
						this.options.display=false;
						this.options.show=false
					}
					this.effects={};
					if(this.options.opacity){
						this.effects.opacity="fullOpacity"
					}
					if(this.options.width){
						this.effects.width=this.options.fixedWidth?"fullWidth":"offsetWidth"
					}
					if(this.options.height){
						this.effects.height=this.options.fixedHeight?"fullHeight":"scrollHeight"
					}
					for(var b=0,a=this.togglers.length;b<a;b++){
						this.addSection(this.togglers[b],this.elements[b])
					}
					this.elements.each(function(f,d){
						if(this.options.show===d){
							this.fireEvent("active",[this.togglers[d],f])
						}else{
							for(var g in this.effects){
								f.setStyle(g,0)
							}
						}
					},this);
					if($chk(this.options.display)||this.options.initialDisplayFx===false){
						this.display(this.options.display,this.options.initialDisplayFx)
					}
					if(this.options.fixedHeight!==false){
						this.options.returnHeightToAuto=false
					}
					this.addEvent("complete",this.internalChain.callChain.bind(this.internalChain))
				},
				addSection:function(f,c){
					f=document.id(f);
					c=document.id(c);
					var g=this.togglers.contains(f);
					this.togglers.include(f);
					this.elements.include(c);
					var a=this.togglers.indexOf(f);
					var b=this.display.bind(this,a);
					f.store("accordion:display",b);
					f.addEvent(this.options.trigger,b);
					if(this.options.height){
						c.setStyles({
							"padding-top":0,
							"border-top":"none",
							"padding-bottom":0,
							"border-bottom":"none"
						})
					}
					if(this.options.width){
						c.setStyles({
							"padding-left":0,
							"border-left":"none",
							"padding-right":0,
							"border-right":"none"
						})
					}
					c.fullOpacity=1;
					if(this.options.fixedWidth){
						c.fullWidth=this.options.fixedWidth
					}
					if(this.options.fixedHeight){
						c.fullHeight=this.options.fixedHeight
					}
					c.setStyle("overflow","hidden");
					if(!g){
						for(var d in this.effects){
							c.setStyle(d,0)
						}
					}
					return this
				},
				detach:function(){
					this.togglers.each(function(a){
						a.removeEvent(this.options.trigger,a.retrieve("accordion:display"))
					},this)
				},
				display:function(a,b){
					if(!this.check(a,b)){
						return this
					}
					b=$pick(b,true);
					if(this.options.returnHeightToAuto){
						var d=this.elements[this.previous];
						if(d&&!this.selfHidden){
							for(var c in this.effects){
								d.setStyle(c,d[this.effects[c]])
							}
						}
					}
					a=($type(a)=="element")?this.elements.indexOf(a):a;
					if((this.timer&&this.options.wait)||(a===this.previous&&!this.options.alwaysHide)){
						return this
					}
					this.previous=a;
					var f={};
					this.elements.each(function(j,h){
						f[h]={};
						var g;
						if(h!=a){
							g=true
						}else{
							if(this.options.alwaysHide&&((j.offsetHeight>0&&this.options.height)||j.offsetWidth>0&&this.options.width)){
								g=true;
								this.selfHidden=true
							}
						}
						this.fireEvent(g?"background":"active",[this.togglers[h],j]);
						for(var k in this.effects){
							f[h][k]=g?0:j[this.effects[k]]
						}
					},this);
					this.internalChain.chain(function(){
						if(this.options.returnHeightToAuto&&!this.selfHidden){
							var g=this.elements[a];
							if(g){
								g.setStyle("height","auto")
							}
						}
					}.bind(this));
					return b?this.start(f):this.set(f)
				}
			});
			var Accordion=new Class({
				Extends:Fx.Accordion,
				initialize:function(){
					this.parent.apply(this,arguments);
					var a=Array.link(arguments,{
						container:Element.type
					});
					this.container=a.container
				},
				addSection:function(c,b,f){
					c=document.id(c);
					b=document.id(b);
					var d=this.togglers.contains(c);
					var a=this.togglers.length;
					if(a&&(!d||f)){
						f=$pick(f,a-1);
						c.inject(this.togglers[f],"before");
						b.inject(c,"after")
					}else{
						if(this.container&&!d){
							c.inject(this.container);
							b.inject(this.container)
						}
					}
					return this.parent.apply(this,arguments)
				}
			});
			Fx.Move=new Class({
				Extends:Fx.Morph,
				options:{
					relativeTo:document.body,
					position:"center",
					edge:false,
					offset:{
						x:0,
						y:0
					}},
					start:function(a){
						return this.parent(this.element.position($merge(this.options,a,{returnPos:true})))
					}
				});
				Element.Properties.move={
					set:function(a){
						var b=this.retrieve("move");
						if(b){
							b.cancel()
						}
						return this.eliminate("move").store("move:options",$extend({link:"cancel"},a))
					},
					get:function(a){
						if(a||!this.retrieve("move")){
							if(a||!this.retrieve("move:options")){
								this.set("move",a)
							}
							this.store("move",new Fx.Move(this,this.retrieve("move:options")))
						}
						return this.retrieve("move")
					}
				};
				Element.implement({
					move:function(a){
						this.get("move").start(a);
						return this
					}
				});
				Fx.Reveal=new Class({
					Extends:Fx.Morph,
					options:{
						link:"cancel",
						styles:["padding","border","margin"],
						transitionOpacity:!Browser.Engine.trident4,
						mode:"vertical",
						display:"block",
						hideInputs:Browser.Engine.trident?"select, input, textarea, object, embed":false
					},
					dissolve:function(){
						try{
							if(!this.hiding&&!this.showing){
								if(this.element.getStyle("display")!="none"){
									this.hiding=true;
									this.showing=false;
									this.hidden=true;
									this.cssText=this.element.style.cssText;
									var d=this.element.getComputedSize({
										styles:this.options.styles,
										mode:this.options.mode
									});
									this.element.setStyle("display",this.options.display);
									if(this.options.transitionOpacity){
										d.opacity=1
									}
									var b={};
									$each(d,function(g,f){
										b[f]=[g,0]
									},this);
									this.element.setStyle("overflow","hidden");
									var a=this.options.hideInputs?this.element.getElements(this.options.hideInputs):null;
									this.$chain.unshift(function(){
										if(this.hidden){
											this.hiding=false;
											$each(d,function(g,f){
												d[f]=g
											},this);
											this.element.style.cssText=this.cssText;
											this.element.setStyle("display","none");
											if(a){
												a.setStyle("visibility","visible")
											}
										}
										this.fireEvent("hide",this.element);
										this.callChain()
									}.bind(this));
									if(a){
										a.setStyle("visibility","hidden")
									}
									this.start(b)
								}else{
									this.callChain.delay(10,this);
									this.fireEvent("complete",this.element);
									this.fireEvent("hide",this.element)
								}
							}else{
								if(this.options.link=="chain"){
									this.chain(this.dissolve.bind(this))
								}else{
									if(this.options.link=="cancel"&&!this.hiding){
										this.cancel();
										this.dissolve()
									}
								}
							}
						}
						catch(c){
							this.hiding=false;
							this.element.setStyle("display","none");
							this.callChain.delay(10,this);
							this.fireEvent("complete",this.element);
							this.fireEvent("hide",this.element)
						}
						return this
					},
					reveal:function(){
						try{
							if(!this.showing&&!this.hiding){
								if(this.element.getStyle("display")=="none"||this.element.getStyle("visiblity")=="hidden"||this.element.getStyle("opacity")==0){
									this.showing=true;
									this.hiding=this.hidden=false;
									var d;
									this.cssText=this.element.style.cssText;
									this.element.measure(function(){
										d=this.element.getComputedSize({
											styles:this.options.styles,mode:this.options.mode
										})
									}.bind(this));
									$each(d,function(g,f){
										d[f]=g
									});
									if($chk(this.options.heightOverride)){
										d.height=this.options.heightOverride.toInt()
									}
									if($chk(this.options.widthOverride)){
										d.width=this.options.widthOverride.toInt()
									}
									if(this.options.transitionOpacity){
										this.element.setStyle("opacity",0);
										d.opacity=1
									}
									var b={
										height:0,
										display:this.options.display
									};
									$each(d,function(g,f){
										b[f]=0
									});
									this.element.setStyles($merge(b,{
										overflow:"hidden"
									}));
									var a=this.options.hideInputs?this.element.getElements(this.options.hideInputs):null;
									if(a){
										a.setStyle("visibility","hidden")
									}
									this.start(d);
									this.$chain.unshift(function(){
										this.element.style.cssText=this.cssText;
										this.element.setStyle("display",this.options.display);
										if(!this.hidden){
											this.showing=false
										}
										if(a){
											a.setStyle("visibility","visible")
										}
										this.callChain();
										this.fireEvent("show",this.element)
									}.bind(this))
								}else{
									this.callChain();
									this.fireEvent("complete",this.element);
									this.fireEvent("show",this.element)
								}
							}else{
								if(this.options.link=="chain"){
									this.chain(this.reveal.bind(this))
								}else{
									if(this.options.link=="cancel"&&!this.showing){
										this.cancel();
										this.reveal()
									}
								}
							}
						}
						catch(c){
							this.element.setStyles({
								display:this.options.display,
								visiblity:"visible",
								opacity:1
							});
							this.showing=false;
							this.callChain.delay(10,this);
							this.fireEvent("complete",this.element);
							this.fireEvent("show",this.element)
						}
						return this
					},
					toggle:function(){
						if(this.element.getStyle("display")=="none"||this.element.getStyle("visiblity")=="hidden"||this.element.getStyle("opacity")==0){
							this.reveal()
						}else{
							this.dissolve()
						}
						return this
					},
					cancel:function(){
						this.parent.apply(this,arguments);
						this.element.style.cssText=this.cssText;
						this.hidding=false;
						this.showing=false
					}
				});
				Element.Properties.reveal={
					set:function(a){
						var b=this.retrieve("reveal");
						if(b){
							b.cancel()
						}
						return this.eliminate("reveal").store("reveal:options",a)
					},
					get:function(a){
						if(a||!this.retrieve("reveal")){
							if(a||!this.retrieve("reveal:options")){
								this.set("reveal",a)
							}
							this.store("reveal",new Fx.Reveal(this,this.retrieve("reveal:options")))
						}
						return this.retrieve("reveal")
					}
				};
				Element.Properties.dissolve=Element.Properties.reveal;
				Element.implement({
					reveal:function(a){
						this.get("reveal",a).reveal();
						return this
					},
					dissolve:function(a){
						this.get("reveal",a).dissolve();
						return this
					},
					nix:function(){
						var a=Array.link(arguments,{
							destroy:Boolean.type,
							options:Object.type
						});
						this.get("reveal",a.options).dissolve().chain(function(){
							this[a.destroy?"destroy":"dispose"]()
						}.bind(this));
						return this
					},
					wink:function(){
						var b=Array.link(arguments,{
							duration:Number.type,
							options:Object.type
						});
						var a=this.get("reveal",b.options);
						a.reveal().chain(function(){
							(function(){
								a.dissolve()
							}).delay(b.duration||2000)
						})
					}
				});
				Fx.Scroll=new Class({
					Extends:Fx,
					options:{
						offset:{
							x:0,
							y:0
						},
						wheelStops:true
					},
					initialize:function(b,a){
						this.element=this.subject=document.id(b);
						this.parent(a);
						var d=this.cancel.bind(this,false);
						if($type(this.element)!="element"){
							this.element=document.id(this.element.getDocument().body)
						}
						var c=this.element;
						if(this.options.wheelStops){
							this.addEvent("start",function(){
								c.addEvent("mousewheel",d)
							},true);
							this.addEvent("complete",function(){
								c.removeEvent("mousewheel",d)
							},true)
						}
					},
					set:function(){
						var a=Array.flatten(arguments);
						if(Browser.Engine.gecko){
							a=[Math.round(a[0]),Math.round(a[1])]
						}
						this.element.scrollTo(a[0],a[1])
					},
					compute:function(c,b,a){
						return[0,1].map(function(d){
							return Fx.compute(c[d],b[d],a)
						})
					},
					start:function(c,h){
						if(!this.check(c,h)){
							return this
						}
						var f=this.element.getScrollSize(),b=this.element.getScroll(),d={x:c,y:h};
						for(var g in d){
							var a=f[g];
							if($chk(d[g])){
								d[g]=($type(d[g])=="number")?d[g]:a
							}else{
								d[g]=b[g]
							}
							d[g]+=this.options.offset[g]
						}
						return this.parent([b.x,b.y],[d.x,d.y])
					},
					toTop:function(){
						return this.start(false,0)
					},
					toLeft:function(){
						return this.start(0,false)
					},
					toRight:function(){
						return this.start("right",false)
					},
					toBottom:function(){
						return this.start(false,"bottom")
					},
					toElement:function(b){
						var a=document.id(b).getPosition(this.element);
						return this.start(a.x,a.y)
					},
					scrollIntoView:function(c,f,d){
						f=f?$splat(f):["x","y"];
						var j={};
						c=document.id(c);
						var g=c.getPosition(this.element);
						var k=c.getSize();
						var h=this.element.getScroll();
						var a=this.element.getSize();
						var b={x:g.x+k.x,y:g.y+k.y};
						["x","y"].each(function(l){
							if(f.contains(l)){
								if(b[l]>h[l]+a[l]){
									j[l]=b[l]-a[l]
								}
								if(g[l]<h[l]){
									j[l]=g[l]
								}
							}
							if(j[l]==null){
								j[l]=h[l]
							}
							if(d&&d[l]){
								j[l]=j[l]+d[l]
							}
						},this);
						if(j.x!=h.x||j.y!=h.y){
							this.start(j.x,j.y)
						}
						return this
					},
					scrollToCenter:function(c,f,d){
						f=f?$splat(f):["x","y"];
						c=$(c);
						var j={},
						g=c.getPosition(this.element),
						k=c.getSize(),
						h=this.element.getScroll(),
						a=this.element.getSize(),
						b={
							x:g.x+k.x,
							y:g.y+k.y
						};
						["x","y"].each(function(l){
							if(f.contains(l)){
								j[l]=g[l]-(a[l]-k[l])/2
							}
							if(j[l]==null){
								j[l]=h[l]
							}
							if(d&&d[l]){
								j[l]=j[l]+d[l]
							}
						},this);
						if(j.x!=h.x||j.y!=h.y){
							this.start(j.x,j.y)
						}
						return this
					}
				});
				Fx.Slide=new Class({
					Extends:Fx,
					options:{
						mode:"vertical",
						wrapper:false,
						hideOverflow:true
					},
					initialize:function(b,a){
						this.addEvent("complete",function(){
							this.open=(this.wrapper["offset"+this.layout.capitalize()]!=0);
							if(this.open){
								this.wrapper.setStyle("height","")
							}
							if(this.open&&Browser.Engine.webkit419){
								this.element.dispose().inject(this.wrapper)
							}
						},true);
						this.element=this.subject=document.id(b);
						this.parent(a);
						var d=this.element.retrieve("wrapper");
						var c=this.element.getStyles("margin","position","overflow");
						if(this.options.hideOverflow){
							c=$extend(c,{
								overflow:"hidden"
							})
						}
						if(this.options.wrapper){
							d=document.id(this.options.wrapper).setStyles(c)
						}
						this.wrapper=d||new Element("div",{styles:c}).wraps(this.element);
						this.element.store("wrapper",this.wrapper).setStyle("margin",0);
						this.now=[];
						this.open=true
					},
					vertical:function(){
						this.margin="margin-top";
						this.layout="height";
						this.offset=this.element.offsetHeight
					},
					horizontal:function(){
						this.margin="margin-left";
						this.layout="width";
						this.offset=this.element.offsetWidth
					},
					set:function(a){
						this.element.setStyle(this.margin,a[0]);
						this.wrapper.setStyle(this.layout,a[1]);
						return this
					},
					compute:function(c,b,a){
						return[0,1].map(function(d){
							return Fx.compute(c[d],b[d],a)
						})
					},
					start:function(b,f){
						if(!this.check(b,f)){
							return this
						}
						this[f||this.options.mode]();
						var d=this.element.getStyle(this.margin).toInt();
						var c=this.wrapper.getStyle(this.layout).toInt();
						var a=[[d,c],[0,this.offset]];
						var h=[[d,c],[-this.offset,0]];
						var g;
						switch(b){
							case"in":g=a;
							break;
							case"out":g=h;
							break;
							case"toggle":g=(c==0)?a:h
						}
						return this.parent(g[0],g[1])
					},
					slideIn:function(a){
						return this.start("in",a)
					},
					slideOut:function(a){
						return this.start("out",a)
					},
					hide:function(a){
						this[a||this.options.mode]();
						this.open=false;
						return this.set([-this.offset,0])
					},
					show:function(a){
						this[a||this.options.mode]();
						this.open=true;
						return this.set([0,this.offset])
					},
					toggle:function(a){
						return this.start("toggle",a)
					}
				});
				Element.Properties.slide={
					set:function(b){
						var a=this.retrieve("slide");
						if(a){
							a.cancel()
						}
						return this.eliminate("slide").store("slide:options",$extend({link:"cancel"},b))
					},
					get:function(a){
						if(a||!this.retrieve("slide")){
							if(a||!this.retrieve("slide:options")){
								this.set("slide",a)
							}
							this.store("slide",new Fx.Slide(this,this.retrieve("slide:options")))
						}
						return this.retrieve("slide")
					}
				};
				Element.implement({
					slide:function(d,f){
						d=d||"toggle";
						var b=this.get("slide"),a;
						switch(d){
							case"hide":b.hide(f);
							break;
							case"show":b.show(f);
							break;
							case"toggle":var c=this.retrieve("slide:flag",b.open);
							b[c?"slideOut":"slideIn"](f);
							this.store("slide:flag",!c);
							a=true;
							break;
							default:b.start(d,f)
						}
						if(!a){
							this.eliminate("slide:flag")
						}
						return this
					}
				});
				var SmoothScroll=Fx.SmoothScroll=new Class({
					Extends:Fx.Scroll,
					initialize:function(b,c){
						c=c||document;
						this.doc=c.getDocument();
						var d=c.getWindow();
						this.parent(this.doc,b);
						this.links=$$(this.options.links||this.doc.links);
						var a=d.location.href.match(/^[^#]*/)[0]+"#";
						this.links.each(function(g){
							if(g.href.indexOf(a)!=0){
								return
							}
							var f=g.href.substr(a.length);
							if(f){
								this.useLink(g,f)
							}
						},this);
						if(!Browser.Engine.webkit419){
							this.addEvent("complete",function(){
								d.location.hash=this.anchor
							},true)
						}
					},
					useLink:function(c,a){
						var b;
						c.addEvent("click",function(d){
							if(b!==false&&!b){
								b=document.id(a)||this.doc.getElement("a[name="+a+"]")
							}
							if(b){
								d.preventDefault();
								this.anchor=a;
								this.toElement(b).chain(function(){
									this.fireEvent("scrolledTo",[c,b])
								}.bind(this));
								c.blur()
							}
						}.bind(this))
					}
				});
				var Drag=new Class({
					Implements:[Events,Options],
					options:{
						snap:6,
						unit:"px",
						grid:false,
						style:true,
						limit:false,
						handle:false,
						invert:false,
						preventDefault:false,
						stopPropagation:false,
						modifiers:{
							x:"left",
							y:"top"
						}
					},
					initialize:function(){
						var b=Array.link(arguments,{
							options:Object.type,
							element:$defined
						});
						this.element=document.id(b.element);
						this.document=this.element.getDocument();
						this.setOptions(b.options||{});
						var a=$type(this.options.handle);
						this.handles=((a=="array"||a=="collection")?$$(this.options.handle):document.id(this.options.handle))||this.element;
						this.mouse={
							now:{},
							pos:{}
						};
						this.value={
							start:{},
							now:{}
						};
						this.selection=(Browser.Engine.trident)?"selectstart":"mousedown";
						this.bound={
							start:this.start.bind(this),
							check:this.check.bind(this),
							drag:this.drag.bind(this),
							stop:this.stop.bind(this),
							cancel:this.cancel.bind(this),
							eventStop:$lambda(false)
						};
						this.attach()
					},
					attach:function(){
						this.handles.addEvent("mousedown",this.bound.start);
						return this
					},
					detach:function(){
						this.handles.removeEvent("mousedown",this.bound.start);
						return this
					},
					start:function(c){
						if(c.rightClick){
							return
						}
						if(this.options.preventDefault){
							c.preventDefault()
						}
						if(this.options.stopPropagation){
							c.stopPropagation()
						}
						this.mouse.start=c.page;
						this.fireEvent("beforeStart",this.element);
						var a=this.options.limit;
						this.limit={
							x:[],
							y:[]
						};
						for(var d in this.options.modifiers){
							if(!this.options.modifiers[d]){
								continue
							}
							if(this.options.style){
								this.value.now[d]=this.element.getStyle(this.options.modifiers[d]).toInt()
							}else{
								this.value.now[d]=this.element[this.options.modifiers[d]]
							}
							if(this.options.invert){
								this.value.now[d]*=-1
							}
							this.mouse.pos[d]=c.page[d]-this.value.now[d];
							if(a&&a[d]){
								for(var b=2;b--;b){
									if($chk(a[d][b])){
										this.limit[d][b]=$lambda(a[d][b])()
									}
								}
							}
						}
						if($type(this.options.grid)=="number"){
							this.options.grid={
								x:this.options.grid,
								y:this.options.grid
							}
						}
						this.document.addEvents({
							mousemove:this.bound.check,
							mouseup:this.bound.cancel
						});
						this.document.addEvent(this.selection,this.bound.eventStop)
					},
					check:function(a){
						if(this.options.preventDefault){
							a.preventDefault()
						}
						var b=Math.round(Math.sqrt(Math.pow(a.page.x-this.mouse.start.x,2)+Math.pow(a.page.y-this.mouse.start.y,2)));
						if(b>this.options.snap){
							this.cancel();
							this.document.addEvents({
								mousemove:this.bound.drag,
								mouseup:this.bound.stop
							});
							this.fireEvent("start",[this.element,a]).fireEvent("snap",this.element)
						}
					},
					drag:function(a){
						if(this.options.preventDefault){
							a.preventDefault()
						}
						this.mouse.now=a.page;
						for(var b in this.options.modifiers){
							if(!this.options.modifiers[b]){
								continue
							}
							this.value.now[b]=this.mouse.now[b]-this.mouse.pos[b];
							if(this.options.invert){
								this.value.now[b]*=-1
							}
							if(this.options.limit&&this.limit[b]){
								if($chk(this.limit[b][1])&&(this.value.now[b]>this.limit[b][1])){
									this.value.now[b]=this.limit[b][1]
								}else{
									if($chk(this.limit[b][0])&&(this.value.now[b]<this.limit[b][0])){
										this.value.now[b]=this.limit[b][0]
									}
								}
							}
							if(this.options.grid[b]){
								this.value.now[b]-=((this.value.now[b]-(this.limit[b][0]||0))%this.options.grid[b])
							}
							if(this.options.style){
								this.element.setStyle(this.options.modifiers[b],this.value.now[b]+this.options.unit)
							}else{
								this.element[this.options.modifiers[b]]=this.value.now[b]
							}
						}
						this.fireEvent("drag",[this.element,a])
					},
					cancel:function(a){
						this.document.removeEvent("mousemove",this.bound.check);
						this.document.removeEvent("mouseup",this.bound.cancel);
						if(a){
							this.document.removeEvent(this.selection,this.bound.eventStop);
							this.fireEvent("cancel",this.element)
						}
					},
					stop:function(a){
						this.document.removeEvent(this.selection,this.bound.eventStop);
						this.document.removeEvent("mousemove",this.bound.drag);
						this.document.removeEvent("mouseup",this.bound.stop);
						if(a){
							this.fireEvent("complete",[this.element,a])
						}
					}
				});
				Element.implement({
					makeResizable:function(a){
						var b=new Drag(this,$merge({
							modifiers:{
								x:"width",
								y:"height"
							}
						},a));
						this.store("resizer",b);
						return b.addEvent("drag",function(){
							this.fireEvent("resize",b)
						}.bind(this))
					}
				});
				Drag.Move=new Class({
					Extends:Drag,
					options:{
						droppables:[],
						container:false,
						precalculate:false,
						includeMargins:true,
						checkDroppables:true
					},
					initialize:function(b,a){
						this.parent(b,a);
						b=this.element;
						this.droppables=$$(this.options.droppables);
						this.container=document.id(this.options.container);
						if(this.container&&$type(this.container)!="element"){
							this.container=document.id(this.container.getDocument().body)
						}
						var c=b.getStyles("left","top","position");
						if(c.left=="auto"||c.top=="auto"){
							b.setPosition(b.getPosition(b.getOffsetParent()))
						}
						if(c.position=="static"){
							b.setStyle("position","absolute")
						}
						this.addEvent("start",this.checkDroppables,true);
						this.overed=null
					},
					start:function(a){
						if(this.container){
							this.options.limit=this.calculateLimit()
						}
						if(this.options.precalculate){
							this.positions=this.droppables.map(function(b){
								return b.getCoordinates()
							})
						}
						this.parent(a)
					},
					calculateLimit:function(){
						var d=this.element.getOffsetParent(),h=this.container.getCoordinates(d),g={},c={},b={},k={},m={};
						["top","right","bottom","left"].each(function(r){
							g[r]=this.container.getStyle("border-"+r).toInt();
							b[r]=this.element.getStyle("border-"+r).toInt();
							c[r]=this.element.getStyle("margin-"+r).toInt();
							k[r]=this.container.getStyle("margin-"+r).toInt();
							m[r]=d.getStyle("padding-"+r).toInt()
						},this);
						var f=this.element.offsetWidth+c.left+c.right,q=this.element.offsetHeight+c.top+c.bottom,j=0,l=0,o=h.right-g.right-f,a=h.bottom-g.bottom-q;
						if(this.options.includeMargins){
							j+=c.left;
							l+=c.top
						}else{
							o+=c.right;
							a+=c.bottom
						}
						if(this.element.getStyle("position")=="relative"){
							var n=this.element.getCoordinates(d);
							n.left-=this.element.getStyle("left").toInt();
							n.top-=this.element.getStyle("top").toInt();
							j+=g.left-n.left;
							l+=g.top-n.top;
							o+=c.left-n.left;
							a+=c.top-n.top;
							if(this.container!=d){
								j+=k.left+m.left;
								l+=(Browser.Engine.trident4?0:k.top)+m.top
							}
						}else{
							j-=c.left;
							l-=c.top;
							if(this.container==d){
								o-=g.left;
								a-=g.top
							}else{
								j+=h.left+g.left;
								l+=h.top+g.top
							}
						}
						return{
							x:[j,o],
							y:[l,a]
						}
					},
					checkAgainst:function(c,b){
						c=(this.positions)?this.positions[b]:c.getCoordinates();
						var a=this.mouse.now;
						return(a.x>c.left&&a.x<c.right&&a.y<c.bottom&&a.y>c.top)
					},
					checkDroppables:function(){
						var a=this.droppables.filter(this.checkAgainst,this).getLast();
						if(this.overed!=a){
							if(this.overed){
								this.fireEvent("leave",[this.element,this.overed])
							}
							if(a){
								this.fireEvent("enter",[this.element,a])
							}
							this.overed=a
						}
					},
					drag:function(a){
						this.parent(a);
						if(this.options.checkDroppables&&this.droppables.length){
							this.checkDroppables()
						}
					},
					stop:function(a){
						this.checkDroppables();
						this.fireEvent("drop",[this.element,this.overed,a]);
						this.overed=null;
						return this.parent(a)
					}
				});
				Element.implement({
					makeDraggable:function(a){
						var b=new Drag.Move(this,a);
						this.store("dragger",b);
						return b
					}
				});
				var Slider=new Class({
					Implements:[Events,Options],
					Binds:["clickedElement","draggedKnob","scrolledElement"],
					options:{
						onTick:function(a){
							if(this.options.snap){
								a=this.toPosition(this.step)
							}
							this.knob.setStyle(this.property,a)
						},
						initialStep:0,
						snap:false,
						offset:0,
						range:false,
						wheel:false,
						steps:100,
						mode:"horizontal"
					},
					initialize:function(g,a,f){
						this.setOptions(f);
						this.element=document.id(g);
						this.knob=document.id(a);
						this.previousChange=this.previousEnd=this.step=-1;
						var h,b={},d={x:false,y:false};
						switch(this.options.mode){
							case"vertical":this.axis="y";
							this.property="top";
							h="offsetHeight";
							break;
							case"horizontal":this.axis="x";
							this.property="left";
							h="offsetWidth"
						}
						this.full=this.element.measure(function(){
							this.half=this.knob[h]/2;
							return this.element[h]-this.knob[h]+(this.options.offset*2)
						}.bind(this));
						this.min=$chk(this.options.range[0])?this.options.range[0]:0;
						this.max=$chk(this.options.range[1])?this.options.range[1]:this.options.steps;
						this.range=this.max-this.min;
						this.steps=this.options.steps||this.full;
						this.stepSize=Math.abs(this.range)/this.steps;this.stepWidth=this.stepSize*this.full/Math.abs(this.range);
						this.knob.setStyle("position","relative").setStyle(this.property,this.options.initialStep?this.toPosition(this.options.initialStep):-this.options.offset);
						d[this.axis]=this.property;
						b[this.axis]=[-this.options.offset,this.full-this.options.offset];
						var c={
							snap:0,
							limit:b,
							modifiers:d,
							onDrag:this.draggedKnob,
							onStart:this.draggedKnob,
							onBeforeStart:(function(){
								this.isDragging=true
							}).bind(this),
							onCancel:function(){
								this.isDragging=false
							}.bind(this),
							onComplete:function(){
								this.isDragging=false;
								this.draggedKnob();
								this.end()
							}.bind(this)
						};
						if(this.options.snap){
							c.grid=Math.ceil(this.stepWidth);
							c.limit[this.axis][1]=this.full
						}
						this.drag=new Drag(this.knob,c);
						this.attach()
					},
					attach:function(){
						this.element.addEvent("mousedown",this.clickedElement);
						if(this.options.wheel){
							this.element.addEvent("mousewheel",this.scrolledElement)
						}
						this.drag.attach();
						return this
					},
					detach:function(){
						this.element.removeEvent("mousedown",this.clickedElement);
						this.element.removeEvent("mousewheel",this.scrolledElement);
						this.drag.detach();
						return this
					},
					set:function(a){
						if(!((this.range>0)^(a<this.min))){
							a=this.min
						}
						if(!((this.range>0)^(a>this.max))){
							a=this.max
						}
						this.step=Math.round(a);
						this.checkStep();
						this.fireEvent("tick",this.toPosition(this.step));
						this.end();
						return this
					},
					clickedElement:function(c){
						if(this.isDragging||c.target==this.knob){
							return
						}
						var b=this.range<0?-1:1;
						var a=c.page[this.axis]-this.element.getPosition()[this.axis]-this.half;
						a=a.limit(-this.options.offset,this.full-this.options.offset);
						this.step=Math.round(this.min+b*this.toStep(a));
						this.checkStep();
						this.fireEvent("tick",a);
						this.end()
					},
					scrolledElement:function(a){
						var b=(this.options.mode=="horizontal")?(a.wheel<0):(a.wheel>0);
						this.set(b?this.step-this.stepSize:this.step+this.stepSize);
						a.stop()
					},
					draggedKnob:function(){
						var b=this.range<0?-1:1;
						var a=this.drag.value.now[this.axis];
						a=a.limit(-this.options.offset,this.full-this.options.offset);
						this.step=Math.round(this.min+b*this.toStep(a));
						this.checkStep()
					},
					checkStep:function(){
						if(this.previousChange!=this.step){
							this.previousChange=this.step;
							this.fireEvent("change",this.step)
						}
					},
					end:function(){
						if(this.previousEnd!==this.step){
							this.previousEnd=this.step;
							this.fireEvent("complete",this.step+"")
						}
					},
					toStep:function(a){
						var b=(a+this.options.offset)*this.stepSize/this.full*this.steps;
						return this.options.steps?Math.round(b-=b%this.stepSize):b
					},
					toPosition:function(a){
						return(this.full*Math.abs(this.min-a))/(this.steps*this.stepSize)-this.options.offset
					}
				});
				var Sortables=new Class({
					Implements:[Events,Options],
					options:{
						snap:4,
						opacity:1,
						clone:false,
						revert:false,
						handle:false,
						constrain:false
					},
					initialize:function(a,b){
						this.setOptions(b);
						this.elements=[];
						this.lists=[];
						this.idle=true;
						this.addLists($$(document.id(a)||a));
						if(!this.options.clone){
							this.options.revert=false
						}
						if(this.options.revert){
							this.effect=new Fx.Morph(null,$merge({
								duration:250,
								link:"cancel"
							},
							this.options.revert))
						}
					},
					attach:function(){
						this.addLists(this.lists);
						return this
					},
					detach:function(){
						this.lists=this.removeLists(this.lists);
						return this
					},
					addItems:function(){
						Array.flatten(arguments).each(function(a){
							this.elements.push(a);
							var b=a.retrieve("sortables:start",this.start.bindWithEvent(this,a));
							(this.options.handle?a.getElement(this.options.handle)||a:a).addEvent("mousedown",b)
						},this);
						return this
					},
					addLists:function(){
						Array.flatten(arguments).each(function(a){
							this.lists.push(a);
							this.addItems(a.getChildren())
						},this);
						return this
					},
					removeItems:function(){
						return $$(Array.flatten(arguments).map(function(a){
							this.elements.erase(a);
							var b=a.retrieve("sortables:start");
							(this.options.handle?a.getElement(this.options.handle)||a:a).removeEvent("mousedown",b);
							return a
						},this))
					},
					removeLists:function(){
						return $$(Array.flatten(arguments).map(function(a){
							this.lists.erase(a);
							this.removeItems(a.getChildren());
							return a
						},this))
					},
					getClone:function(b,a){
						if(!this.options.clone){
							return new Element("div").inject(document.body)
						}
						if($type(this.options.clone)=="function"){
							return this.options.clone.call(this,b,a,this.list)
						}
						var c=a.clone(true).setStyles({
							margin:"0px",
							position:"absolute",
							visibility:"hidden",
							width:a.getStyle("width")
						});
						if(c.get("html").test("radio")){
							c.getElements("input[type=radio]").each(function(d,f){
								d.set("name","clone_"+f)
							})
						}
						return c.inject(this.list).setPosition(a.getPosition(a.getOffsetParent()))
					},
					getDroppables:function(){
						var a=this.list.getChildren();
						if(!this.options.constrain){
							a=this.lists.concat(a).erase(this.list)
						}
						return a.erase(this.clone).erase(this.element)
					},
					insert:function(c,b){
						var a="inside";
						if(this.lists.contains(b)){
							this.list=b;
							this.drag.droppables=this.getDroppables()
						}else{
							a=this.element.getAllPrevious().contains(b)?"before":"after"
						}
						this.element.inject(b,a);
						this.fireEvent("sort",[this.element,this.clone])
					},
					start:function(b,a){
						if(!this.idle){
							return
						}
						this.idle=false;
						this.element=a;
						this.opacity=a.get("opacity");
						this.list=a.getParent();
						this.clone=this.getClone(b,a);
						this.drag=new Drag.Move(this.clone,{
							snap:this.options.snap,
							container:this.options.constrain&&this.element.getParent(),
							droppables:this.getDroppables(),
							onSnap:function(){
								b.stop();
								this.clone.setStyle("visibility","visible");
								this.element.set("opacity",this.options.opacity||0);
								this.fireEvent("start",[this.element,this.clone])
							}.bind(this),
							onEnter:this.insert.bind(this),
							onCancel:this.reset.bind(this),
							onComplete:this.end.bind(this)
						});
						this.clone.inject(this.element,"before");
						this.drag.start(b)
					},
					end:function(){
						this.drag.detach();
						this.element.set("opacity",this.opacity);
						if(this.effect){
							var a=this.element.getStyles("width","height");
							var b=this.clone.computePosition(this.element.getPosition(this.clone.offsetParent));
							this.effect.element=this.clone;
							this.effect.start({
								top:b.top,
								left:b.left,
								width:a.width,
								height:a.height,
								opacity:0.25
							}).chain(this.reset.bind(this))
						}else{
							this.reset()
						}
					},
					reset:function(){
						this.idle=true;
						this.clone.destroy();
						this.fireEvent("complete",this.element)
					},
					serialize:function(){
						var c=Array.link(arguments,{
							modifier:Function.type,
							index:$defined
						});
						var b=this.lists.map(function(d){
							return d.getChildren().map(c.modifier||function(f){
								return f.get("id")
							},this)
						},this);
						var a=c.index;
						if(this.lists.length==1){
							a=0
						}
						return $chk(a)&&a>=0&&a<this.lists.length?b[a]:b
					}
				});
				Request.implement({
					options:{
						initialDelay:5000,
						delay:5000,
						limit:60000
					},
					startTimer:function(b){
						var a=function(){
							if(!this.running){
								this.send({
									data:b
								})
							}
						};
						this.timer=a.delay(this.options.initialDelay,this);
						this.lastDelay=this.options.initialDelay;
						this.completeCheck=function(c){
							$clear(this.timer);
							this.lastDelay=(c)?this.options.delay:(this.lastDelay+this.options.delay).min(this.options.limit);
							this.timer=a.delay(this.lastDelay,this)
						};
						return this.addEvent("complete",this.completeCheck)
					},
					stopTimer:function(){
						$clear(this.timer);
						return this.removeEvent("complete",this.completeCheck)
					}
				});
				Hash.Cookie=new Class({
					Extends:Cookie,
					options:{
						autoSave:true
					},
					initialize:function(b,a){
						this.parent(b,a);
						this.load()
					},
					save:function(){
						var a=JSON.encode(this.hash);
						if(!a||a.length>4096){
							return false
						}
						if(a=="{}"){
							this.dispose()
						}else{
							this.write(a)
						}
						return true
					},
					load:function(){
						this.hash=new Hash(JSON.decode(this.read(),true));
						return this
					}
				});
				Hash.each(Hash.prototype,function(b,a){
					if(typeof b=="function"){
						Hash.Cookie.implement(a,function(){
							var c=b.apply(this.hash,arguments);
							if(this.options.autoSave){
								this.save()
							}
							return c
						})
					}
				});
				var Scroller=new Class({
					Implements:[Events,Options],
					options:{
						area:20,
						velocity:1,
						onChange:function(a,b){
							this.element.scrollTo(a,b)
						},
						fps:50
					},
					initialize:function(b,a){
						this.setOptions(a);
						this.element=document.id(b);
						this.docBody=document.id(this.element.getDocument().body);
						this.listener=($type(this.element)!="element")?this.docBody:this.element;
						this.timer=null;
						this.bound={
							attach:this.attach.bind(this),
							detach:this.detach.bind(this),
							getCoords:this.getCoords.bind(this)
						}
					},
					start:function(){
						this.listener.addEvents({
							mouseover:this.bound.attach,
							mouseout:this.bound.detach
						})
					},
					stop:function(){
						this.listener.removeEvents({
							mouseover:this.bound.attach,
							mouseout:this.bound.detach
						});
						this.detach();
						this.timer=$clear(this.timer)
					},
					attach:function(){
						this.listener.addEvent("mousemove",this.bound.getCoords)
					},
					detach:function(){
						this.listener.removeEvent("mousemove",this.bound.getCoords);
						this.timer=$clear(this.timer)
					},
					getCoords:function(a){
						this.page=(this.listener.get("tag")=="body")?a.client:a.page;
						if(!this.timer){
							this.timer=this.scroll.periodical(Math.round(1000/this.options.fps),this)
						}
					},
					scroll:function(){
						var b=this.element.getSize(),a=this.element.getScroll(),g=this.element!=this.docBody?this.element.getOffsets():{x:0,y:0},c=this.element.getScrollSize(),f={x:0,y:0};
						for(var d in this.page){
							if(this.page[d]<(this.options.area+g[d])&&a[d]!=0){
								f[d]=(this.page[d]-this.options.area-g[d])*this.options.velocity
							}else{
								if(this.page[d]+this.options.area>(b[d]+g[d])&&a[d]+b[d]!=c[d]){
									f[d]=(this.page[d]-b[d]+this.options.area-g[d])*this.options.velocity
								}
							}
						}
						if(f.y||f.x){
							this.fireEvent("change",[a.x+f.x,a.y+f.y])
						}
					}
				});
				(function(){
					var a=function(c,b){
						return(c)?($type(c)=="function"?c(b):b.get(c)):""
					};
					this.Tips=new Class({
						Implements:[Events,Options],
						options:{
							onShow:function(){
								this.tip.setStyle("display","block")
							},
							onHide:function(){
								this.tip.setStyle("display","none")
							},
							title:"title",
							text:function(b){
								return b.get("rel")||b.get("href")
							},
							showDelay:100,
							hideDelay:100,
							className:"tip-wrap",
							offset:{
								x:16,
								y:16
							},
							windowPadding:{
								x:0,
								y:0
							},
							fixed:false
						},
						initialize:function(){
							var b=Array.link(arguments,{
								options:Object.type,elements:$defined
							});
							this.setOptions(b.options);
							if(b.elements){
								this.attach(b.elements)
							}
							this.container=new Element("div",{"class":"tip"})
						},
						toElement:function(){
							if(this.tip){
								return this.tip
							}
							return this.tip=new Element("div",{
								"class":this.options.className,
								styles:{
									position:"absolute",
									top:0,
									left:0
								}
							}).adopt(new Element("div",{
								"class":"tip-top"
							}),
							this.container,new Element("div",{"class":"tip-bottom"})).inject(document.body)
						},
						attach:function(b){
							$$(b).each(function(d){
								var g=a(this.options.title,d),f=a(this.options.text,d);
								d.erase("title").store("tip:native",g).retrieve("tip:title",g);
								d.retrieve("tip:text",f);
								this.fireEvent("attach",[d]);
								var c=["enter","leave"];
								if(!this.options.fixed){
									c.push("move")
								}
								c.each(function(j){
									var h=d.retrieve("tip:"+j);
									if(!h){
										h=this["element"+j.capitalize()].bindWithEvent(this,d)
									}
									d.store("tip:"+j,h).addEvent("mouse"+j,h)
								},this)
							},this);
							return this
						},
						detach:function(b){
							$$(b).each(function(d){
								["enter","leave","move"].each(function(f){
									d.removeEvent("mouse"+f,d.retrieve("tip:"+f)).eliminate("tip:"+f)
								});
								this.fireEvent("detach",[d]);
								if(this.options.title=="title"){
									var c=d.retrieve("tip:native");
									if(c){
										d.set("title",c)
									}
								}
							},this);
							return this
						},
						elementEnter:function(c,b){
							this.container.empty();
							["title","text"].each(function(f){
								var d=b.retrieve("tip:"+f);
								if(d){
									this.fill(new Element("div",{
										"class":"tip-"+f
									}).inject(this.container),d)
								}
							},this);
							$clear(this.timer);
							this.timer=(function(){
								this.show(this,b);
								this.position((this.options.fixed)?{
									page:b.getPosition()
								}:c)
							}).delay(this.options.showDelay,this)
						},
						elementLeave:function(c,b){
							$clear(this.timer);
							this.timer=this.hide.delay(this.options.hideDelay,this,b);
							this.fireForParent(c,b)
						},
						fireForParent:function(c,b){
							b=b.getParent();
							if(!b||b==document.body){
								return
							}
							if(b.retrieve("tip:enter")){
								b.fireEvent("mouseenter",c)
							}else{
								this.fireForParent(c,b)
							}
						},
						elementMove:function(c,b){
							this.position(c)
						},
						position:function(f){
							if(!this.tip){
								document.id(this)
							}
							var c=window.getSize(),b=window.getScroll(),g={x:this.tip.offsetWidth,y:this.tip.offsetHeight},d={x:"left",y:"top"},h={};
							for(var j in d){
								h[d[j]]=f.page[j]+this.options.offset[j];
								if((h[d[j]]+g[j]-b[j])>c[j]-this.options.windowPadding[j]){
									h[d[j]]=f.page[j]-this.options.offset[j]-g[j]
								}
							}
							this.tip.setStyles(h)
						},
						fill:function(b,c){
							if(typeof c=="string"){
								b.set("html",c)
							}else{
								b.adopt(c)
							}
						},
						show:function(b){
							if(!this.tip){
								document.id(this)
							}
							this.fireEvent("show",[this.tip,b])
						},
						hide:function(b){
							if(!this.tip){
								document.id(this)
							}
							this.fireEvent("hide",[this.tip,b])
						}
					})
				})();
				var Observer=new Class({
					Implements:[Options,Events],
					options:{
						periodical:false,
						delay:1000
					},
					initialize:function(c,a,b){
						this.element=$(c)||$$(c);
						this.addEvent("onFired",a);
						this.setOptions(b);
						this.bound=this.changed.bind(this);
						this.resume()
					},
					changed:function(){
						var a=this.element.get("value");
						if($equals(this.value,a)){
							return
						}
						this.clear();
						this.value=a;
						this.timeout=this.onFired.delay(this.options.delay,this)
					},
					setValue:function(a){
						this.value=a;
						this.element.set("value",a);
						return this.clear()
					},
					onFired:function(){
						this.fireEvent("onFired",[this.value,this.element])
					},
					clear:function(){
						$clear(this.timeout||null);
						return this
					},
					pause:function(){
						if(this.timer){
							$clear(this.timer)
						}else{
							this.element.removeEvent("keyup",this.bound)
						}
						return this.clear()
					},
					resume:function(){
						this.value=this.element.get("value");
						if(this.options.periodical){
							this.timer=this.changed.periodical(this.options.periodical,this)
						}else{
							this.element.addEvent("keyup",this.bound)
						}
						return this
					}
				});
				var $equals=function(b,a){
					return(b==a||JSON.encode(b)==JSON.encode(a))
				};
				var Overlay=new Class({
					Implements:[Options,Events],
					options:{
						id:"overlay",
						color:"#000",
						duration:500,
						opacity:0.5,
						zIndex:5000
					},
					initialize:function(a,b){
						this.setOptions(b);
						this.container=document.id(a);
						if(Browser.Engine.trident&&Browser.Engine.version<=6){
							this.ie6=true
						}
						this.overlay=new Element("div",{
							id:this.options.id,
							opacity:0,
							styles:{
								position:(this.ie6)?"absolute":"fixed",
								background:this.options.color,
								left:0,
								top:0,
								"z-index":this.options.zIndex
							},
							events:{
								click:function(){
									this.fireEvent("click")
								}.bind(this)
							}
						}).inject(this.container);
						this.tween=new Fx.Tween(this.overlay,{
							duration:this.options.duration,
							link:"cancel",
							property:"opacity",
							onStart:function(){
								this.overlay.setStyles({
									width:"100%",
									height:this.container.getScrollSize().y
								})
							}.bind(this),
							onComplete:function(){
								this.fireEvent(this.overlay.get("opacity")==this.options.opacity?"show":"hide")
							}.bind(this)
						});
						window.addEvents({
							resize:function(){
								this.resize()
							}.bind(this),
							scroll:function(){
								this.scroll()
							}.bind(this)
						})
					},
					open:function(){
						this.fireEvent("open");
						this.tween.start(this.options.opacity);
						return this
					},
					close:function(){
						this.fireEvent("close");
						this.tween.start(0);
						return this
					},
					resize:function(){
						this.fireEvent("resize");
						this.overlay.setStyle("height",this.container.getScrollSize().y);
						return this
					},
					scroll:function(){
						this.fireEvent("scroll");
						if(this.ie6){
							this.overlay.setStyle("left",window.getScroll().x)
						}
						return this
					}
				});
				var Autocompleter=new Class({
					Implements:[Options,Events],
					options:{
						minLength:1,
						markQuery:true,
						width:"inherit",
						maxChoices:10,
						injectChoice:null,
						customChoices:null,
						emptyChoices:null,
						visibleChoices:true,
						className:"autocompleter-choices",
						zIndex:42,
						delay:400,
						observerOptions:{},
						fxOptions:{},
						autoSubmit:false,
						overflow:false,
						overflowMargin:25,
						selectFirst:false,
						filter:null,
						filterCase:false,
						filterSubset:false,
						forceSelect:false,
						selectMode:true,
						choicesMatch:null,
						multiple:false,
						separator:", ",
						separatorSplit:/\s*[,;]\s*/,
						autoTrim:false,
						allowDupes:false,
						cache:true,
						relative:false
					},
					initialize:function(b,a){
						this.element=$(b);
						this.setOptions(a);
						this.build();
						this.observer=new Observer(this.element,this.prefetch.bind(this),$merge({
							delay:this.options.delay
						},
						this.options.observerOptions));
						this.queryValue=null;
						if(this.options.filter){
							this.filter=this.options.filter.bind(this)
						}
						var c=this.options.selectMode;
						this.typeAhead=(c=="type-ahead");
						this.selectMode=(c===true)?"selection":c;
						this.cached=[]
					},
					build:function(){
						if($(this.options.customChoices)){
							this.choices=this.options.customChoices
						}else{
							this.choices=new Element("ul",{
								"class":this.options.className,
								styles:{
									zIndex:this.options.zIndex
								}
							}).inject(document.body);
							this.relative=false;
							if(this.options.relative){
								this.choices.inject(this.element,"after");
								this.relative=this.element.getOffsetParent()
							}
							this.fix=new OverlayFix(this.choices)
						}
						if(!this.options.separator.test(this.options.separatorSplit)){
							this.options.separatorSplit=this.options.separator
						}
						this.fx=(!this.options.fxOptions)?null:new Fx.Tween(this.choices,$merge({
							property:"opacity",
							link:"cancel",
							duration:200
						},
						this.options.fxOptions)).addEvent("onStart",Chain.prototype.clearChain).set(0);
						this.element.setProperty("autocomplete","off").addEvent((Browser.Engine.trident||Browser.Engine.webkit)?"keydown":"keypress",this.onCommand.bind(this)).addEvent("click",this.onCommand.bind(this,[false])).addEvent("focus",this.toggleFocus.create({
							bind:this,
							arguments:true,
							delay:100
						})).addEvent("blur",this.toggleFocus.create({
							bind:this,
							arguments:false,
							delay:100
						}))
					},
					destroy:function(){
						if(this.fix){
							this.fix.destroy()
						}
						this.choices=this.selected=this.choices.destroy()
					},
					toggleFocus:function(a){
						this.focussed=a;
						if(!a){
							this.hideChoices(true)
						}
						this.fireEvent((a)?"onFocus":"onBlur",[this.element])
					},
					onCommand:function(b){
						if(!b&&this.focussed){
							return this.prefetch()
						}
						if(b&&b.key&&!b.shift){
							switch(b.key){
								case"enter":if(this.element.value!=this.opted){
									return true
								}
								if(this.selected&&this.visible){
									this.choiceSelect(this.selected);
									return !!(this.options.autoSubmit)
								}
								break;
								case"up":case"down":if(!this.prefetch()&&this.queryValue!==null){
									var a=(b.key=="up");
									this.choiceOver((this.selected||this.choices)[(this.selected)?((a)?"getPrevious":"getNext"):((a)?"getLast":"getFirst")](this.options.choicesMatch),true)
								}
								return false;
								case"esc":case"tab":this.hideChoices(true);
								break
							}
						}
						return true
					},
					setSelection:function(g){
						var h=this.selected.inputValue,j=h;
						var a=this.queryValue.length,c=h.length;
						if(h.substr(0,a).toLowerCase()!=this.queryValue.toLowerCase()){
							a=0
						}
						if(this.options.multiple){
							var f=this.options.separatorSplit;
							j=this.element.value;
							a+=this.queryIndex;
							c+=this.queryIndex;
							var b=j.substr(this.queryIndex).split(f,1)[0];
							j=j.substr(0,this.queryIndex)+h+j.substr(this.queryIndex+b.length);
							if(g){
								var d=j.split(this.options.separatorSplit).filter(function(l){
									return this.test(l)
								},/[^\s,]+/
							);
							if(!this.options.allowDupes){
								d=[].combine(d)
							}
							var k=this.options.separator;
							j=d.join(k)+k;
							c=j.length
						}
					}
					this.observer.setValue(j);
					this.opted=j;
					if(g||this.selectMode=="pick"){
						a=c
					}
					this.element.selectRange(a,c);
					this.fireEvent("onSelection",[this.element,this.selected,j,h])
				},
				showChoices:function(){
					var c=this.options.choicesMatch,b=this.choices.getFirst(c);
					this.selected=this.selectedValue=null;
					if(this.fix){
						var f=this.element.getCoordinates(this.relative),a=this.options.width||"auto";
						this.choices.setStyles({
							left:f.left,
							top:f.bottom,
							width:(a===true||a=="inherit")?f.width:a
						})
					}
					if(!b){
						return
					}
					if(!this.visible){
						this.visible=true;
						this.choices.setStyle("display","");
						if(this.fx){
							this.fx.start(1)
						}
						this.fireEvent("onShow",[this.element,this.choices])
					}
					if(this.options.selectFirst||this.typeAhead||b.inputValue==this.queryValue){
						this.choiceOver(b,this.typeAhead)
					}
					var d=this.choices.getChildren(c),g=this.options.maxChoices;
					var k={
						overflowY:"hidden",
						height:""
					};
					this.overflown=false;
					if(d.length>g){
						var l=d[g-1];
						k.overflowY="scroll";
						k.height=l.getCoordinates(this.choices).bottom;
						this.overflown=true
					}
					this.choices.setStyles(k);
					this.fix.show();
					if(this.options.visibleChoices){
						var j=document.getScroll(),m=document.getSize(),h=this.choices.getCoordinates();
						if(h.right>j.x+m.x){
							j.x=h.right-m.x
						}
						if(h.bottom>j.y+m.y){
							j.y=h.bottom-m.y
						}
						window.scrollTo(Math.min(j.x,h.left),Math.min(j.y,h.top))
					}
				},
				hideChoices:function(a){
					if(a){
						var c=this.element.value;
						if(this.options.forceSelect){
							c=this.opted
						}
						if(this.options.autoTrim){
							c=c.split(this.options.separatorSplit).filter($arguments(0)).join(this.options.separator)
						}
						this.observer.setValue(c)
					}
					if(!this.visible){
						return
					}
					this.visible=false;
					if(this.selected){
						this.selected.removeClass("autocompleter-selected")
					}
					this.observer.clear();
					var b=function(){
						this.choices.setStyle("display","none");
						this.fix.hide()
					}.bind(this);
					if(this.fx){
						this.fx.start(0).chain(b)
					}else{
						b()
					}
					this.fireEvent("onHide",[this.element,this.choices])
				},
				prefetch:function(){
					var g=this.element.value,f=g;
					if(this.options.multiple){
						var c=this.options.separatorSplit;
						var a=g.split(c);
						var b=this.element.getSelectedRange().start;
						var h=g.substr(0,b).split(c);
						var d=h.length-1;
						b-=h[d].length;
						f=a[d]
					}
					if(f.length<this.options.minLength){
						this.hideChoices()
					}else{
						if(f===this.queryValue||(this.visible&&f==this.selectedValue)){
							if(this.visible){
								return false
							}
							this.showChoices()
						}else{
							this.queryValue=f;
							this.queryIndex=b;
							if(!this.fetchCached()){
								this.query()
							}
						}
					}
					return true
				},
				fetchCached:function(){
					return false;
					if(!this.options.cache||!this.cached||!this.cached.length||this.cached.length>=this.options.maxChoices||this.queryValue){
						return false
					}
					this.update(this.filter(this.cached));
					return true
				},
				update:function(b){
					this.choices.empty();
					this.cached=b;
					var a=b&&$type(b);
					if(!a||(a=="array"&&!b.length)||(a=="hash"&&!b.getLength())){
						(this.options.emptyChoices||this.hideChoices).call(this)
					}else{
						if(this.options.maxChoices<b.length&&!this.options.overflow){
							b.length=this.options.maxChoices
						}
						b.each(this.options.injectChoice||function(d){
							var c=new Element("li",{
								html:this.markQueryValue(d)
							});
							c.inputValue=d;
							this.addChoiceEvents(c).inject(this.choices)
						},this);
						this.showChoices()
					}
				},
				choiceOver:function(c,d){
					if(!c||c==this.selected){
						return
					}
					if(this.selected){
						this.selected.removeClass("autocompleter-selected")
					}
					this.selected=c.addClass("autocompleter-selected");
					this.fireEvent("onSelect",[this.element,this.selected,d]);
					if(!this.selectMode){
						this.opted=this.element.value
					}
					if(!d){
						return
					}
					this.selectedValue=this.selected.inputValue;
					if(this.overflown){
						var g=this.selected.getCoordinates(this.choices),f=this.options.overflowMargin,h=this.choices.scrollTop,a=this.choices.offsetHeight,b=h+a;
						if(g.top-f<h&&h){
							this.choices.scrollTop=Math.max(g.top-f,0)
						}else{
							if(g.bottom+f>b){
								this.choices.scrollTop=Math.min(g.bottom-a+f,b)
							}
						}
					}
					if(this.selectMode){
						this.setSelection()
					}
				},
				choiceSelect:function(a){
					if(a){
						this.choiceOver(a)
					}
					this.setSelection(true);
					this.queryValue=false;
					this.hideChoices()
				},
				filter:function(a){
					return(a||this.tokens).filter(function(b){
						return this.test(b)
					},
					new RegExp(((this.options.filterSubset)?"":"^")+this.queryValue.escapeRegExp(),(this.options.filterCase)?"":"i"))
				},
				markQueryValue:function(a){
					return(!this.options.markQuery||!this.queryValue)?a:a.replace(new RegExp("("+((this.options.filterSubset)?"":"^")+this.queryValue.escapeRegExp()+")",(this.options.filterCase)?"":"i"),'<span class="autocompleter-queried">$1</span>')
				},
				addChoiceEvents:function(a){
					return a.addEvents({
						mouseover:this.choiceOver.bind(this,[a]),
						click:this.choiceSelect.bind(this,[a])
					})
				}
			});
			var OverlayFix=new Class({
				initialize:function(a){
					if(Browser.Engine.trident){
						this.element=$(a);
						this.relative=this.element.getOffsetParent();
						this.fix=new Element("iframe",{
							frameborder:"0",
							scrolling:"no",
							src:"javascript:false;",
							styles:{
								position:"absolute",
								border:"none",
								display:"none",
								filter:"progid:DXImageTransform.Microsoft.Alpha(opacity=0)"
							}
						}).inject(this.element,"after")
					}
				},
				show:function(){
					if(this.fix){
						var a=this.element.getCoordinates(this.relative);
						delete a.right;
						delete a.bottom;
						this.fix.setStyles($extend(a,{
							display:"",
							zIndex:(this.element.getStyle("zIndex")||1)-1
						}))
					}
					return this
				},
				hide:function(){
					if(this.fix){
						this.fix.setStyle("display","none")
					}
					return this
				},
				destroy:function(){
					if(this.fix){
						this.fix=this.fix.destroy()
					}
				}
			});
			Element.implement({
				getSelectedRange:function(){
					if(!Browser.Engine.trident){
						return{
							start:this.selectionStart,
							end:this.selectionEnd
						}
					}
					var f={
						start:0,
						end:0
					};
					var a=this.getDocument().selection.createRange();
					if(!a||a.parentElement()!=this){
						return f
					}
					var c=a.duplicate();
					if(this.type=="text"){
						f.start=0-c.moveStart("character",-100000);
						f.end=f.start+a.text.length
					}else{
						var b=this.value;
						var d=b.length-b.match(/[\n\r]*$/)[0].length;
						c.moveToElementText(this);
						c.setEndPoint("StartToEnd",a);
						f.end=d-c.text.length;
						c.setEndPoint("StartToStart",a);
						f.start=d-c.text.length
					}
					return f
				},
				selectRange:function(d,a){
					if(Browser.Engine.trident){
						var c=this.value.substr(d,a-d).replace(/\r/g,"").length;
						d=this.value.substr(0,d).replace(/\r/g,"").length;
						var b=this.createTextRange();
						b.collapse(true);
						b.moveEnd("character",d+c);
						b.moveStart("character",d);
						b.select()
					}else{
						this.focus();
						this.setSelectionRange(d,a)
					}
					return this
				}
			});
			Autocompleter.Base=Autocompleter;
			Autocompleter.Local=new Class({
				Extends:Autocompleter,
				options:{
					minLength:0,
					delay:200
				},
				initialize:function(b,c,a){
					this.parent(b,a);
					this.tokens=c
				},
				query:function(){
					this.update(this.filter())
				}
			});
			Autocompleter.Request=new Class({
				Extends:Autocompleter,
				options:{
					postData:{},
					ajaxOptions:{},
					postVar:"value"
				},
				query:function(){
					var c=$unlink(this.options.postData)||{};
					c[this.options.postVar]=this.queryValue;
					var b=$(this.options.indicator);
					if(b){
						b.setStyle("display","")
					}
					var a=this.options.indicatorClass;
					if(a){
						this.element.addClass(a)
					}
					this.fireEvent("onRequest",[this.element,this.request,c,this.queryValue]);
					this.request.send({data:c})
				},
				queryResponse:function(){
					var b=$(this.options.indicator);
					if(b){
						b.setStyle("display","none")
					}
					var a=this.options.indicatorClass;
					if(a){
						this.element.removeClass(a)
					}
					return this.fireEvent("onComplete",[this.element,this.request])
				}
			});
			Autocompleter.Request.JSON=new Class({
				Extends:Autocompleter.Request,
				initialize:function(c,b,a){
					this.parent(c,a);
					this.request=new Request.JSON($merge({
						url:b,
						link:"cancel"
					},
					this.options.ajaxOptions)).addEvent("onComplete",this.queryResponse.bind(this))
				},
				queryResponse:function(a){
					this.parent();
					this.update(a)
				}
			});
			Autocompleter.Request.HTML=new Class({
				Extends:Autocompleter.Request,
				initialize:function(c,b,a){
					this.parent(c,a);
					this.request=new Request.HTML($merge({
						url:b,
						link:"cancel",
						update:this.choices
					},
					this.options.ajaxOptions)).addEvent("onComplete",this.queryResponse.bind(this))
				},
				queryResponse:function(a,b){
					this.parent();
					if(!b||!b.length){
						this.hideChoices()
					}else{
						this.choices.getChildren(this.options.choicesMatch).each(this.options.injectChoice||function(c){
							var d=c.innerHTML;
							c.inputValue=d;
							this.addChoiceEvents(c.set("html",this.markQueryValue(d)))
						},this);
						this.showChoices()
					}
				}
			});
			Autocompleter.Ajax={
				Base:Autocompleter.Request,
				Json:Autocompleter.Request.JSON,
				Xhtml:Autocompleter.Request.HTML
			};
			window.$w=function(a){
				return $A(String(a).split(" "))
			};
			function $clone(a){
				if(a&&a.$family&&a.$family.name=="array"){
					return a
				}
				return $merge(a,{})
			}
			Function.implement({
				wrap:function(b){
					var a=this;
					return function(){
						return b.apply(this,[a.bind(this)].concat($A(arguments)))
					}
				}
			});
			if(JSON.stringify){
				JSON.encode=JSON.encode.wrap(function(b,c){
					if(typeof c=="undefined"){
						c=null
					}
					var a=JSON.stringify(c);
					return a
				});
				delete (Hash.prototype.toJSON);
				delete (Array.prototype.toJSON);
				delete (String.prototype.toJSON);
				delete (Number.prototype.toJSON)
			}
			if(JSON.parse){
				JSON.decode=JSON.decode.wrap(function(b,a,c){
					if(typeof a=="undefined"||a===null){
						return null
					}
					return JSON.parse;
				})
			}
			$extend(Object,{
				toHTML:function(a){
					return a&&a.toHTML?a.toHTML():String.interpret(a)
				}
			});
			$extend(String,{
				interpret:function(a){
					return a==null?"":String(a)
				}
			});
			Element._getContentFromAnonymousElement=function(c,b){
				var d=new Element("div"),a=Element._insertionTranslations.tags[c];
				if(a){
					d.innerHTML=a[0]+b+a[1];
					a[2].times(function(){
						d=d.firstChild
					})
				}else{
					d.innerHTML=b
				}
				return $A(d.childNodes)
			};
			Array.implement({
				find:function(d,c){
					var a;
					var b=d;
					if(c){
						b=b.bind(c)
					}
					this.some(function(g,f,h){
						if(b(g,f,h)){
							a=g;
							return true
						}
						return false
					});
					return a
				},
				inject:function(b,a){
					this.each(function(d,c,f){
						b=a(b,d,c,f)
					});
					return b
				},
				invoke:function(a){
					this.each(function(b){
						if(b&&b[a]){
							b[a]()
						}
					});
					return this
				}
			});
			Element.addClass=Element.addClass.wrap(function(c,b,a){
				if($type(a)!="array"){
					a=$w(a)
				}
				if($type(a)=="array"){
					$each(a,function(d){
						c(d)
					})
				}else{
					c(a)
				}
				return b
			});
			Element.prototype.addClass=Element.prototype.addClass.wrap(function(b,a){
				if($type(a)!="array"){
					a=$w(a)
				}
				if($type(a)=="array"){
					$each(a,function(c){
						b(c)
					})
				}else{
					b(a)
				}
				return this
			});
			Element.removeClass=Element.removeClass.wrap(function(c,b,a){
				if($type(a)!="array"){
					a=$w(a)
				}
				if($type(a)=="array"){
					$each(a,function(d){
						c(d)
					})
				}else{
					c(a)
				}
				return b
			});
			Element.prototype.removeClass=Element.prototype.removeClass.wrap(function(b,a){
				if($type(a)!="array"){
					a=$w(a)
				}
				if($type(a)=="array"){
					$each(a,function(c){
						b(c)
					})
				}else{
					b(a)
				}
				return this
			});
			Element.implement({
				disableSelection:function(){
					return this.setStyles({
						MozUserSelect:"none",
						KhtmlUserSelect:"none"
					}).setProperty("unselectable","on")
				},
				down:function(a){
					return this.getElement(a)
				},
				getSelectionEnd:function(){
					if(this.createTextRange){
						var a=document.selection.createRange().duplicate();
						a.moveStart("character",-this.value.length);
						return a.text.length
					}
					return this.selectionEnd
				},
				getSelectionStart:function(){
					if(this.createTextRange){
						var a=document.selection.createRange().duplicate();
						a.moveEnd("character",this.value.length);
						if(a.text==""){
							return this.value.length
						}
						return this.value.lastIndexOf(a.text)
					}
					return this.selectionStart
				},
				insert:function(f){
					var c=$(this);
					if(typeof f=="string"||typeof f=="number"||(f.nodeName&&f.nodeType==1)||(f&&(f.toElement||f.toHTML))){
						f={
							bottom:f
						}
					}
					var d,g,b,h;
					for(var a in f){
						d=f[a];
						a=a.toLowerCase();
						g=Element._insertionTranslations[a];
						if(d&&d.toElement){
							d=d.toElement()
						}
						if(d.nodeName&&d.nodeType==1){
							g(c,d);
							continue
						}
						d=Object.toHTML(d);
						b=((a=="before"||a=="after")?c.parentNode:c).tagName.toUpperCase();
						h=Element._getContentFromAnonymousElement(b,d);
						if(a=="top"||a=="after"){
							h.reverse()
						}
						h.each(function(j){
							g(c,j)
						})
					}
					return c
				},
				next:function(a){
					return this.getNext(a)
				},
				prev:function(a){
					return this.getPrevious(a)
				},
				select:function(b){
					var c=this;
					var a=[];
					$A(arguments).each(function(d){
						var f=c.getElements(d);
						if($type(f)=="array"){
							a=a.concat(f)
						}
					});
					return a
				},
				setSize:function(b,a){
					if(b&&b.$family&&b.$family.name=="array"){
						a=b[1];
						b=b[0]
					}else{
						if(typeof b=="object"){
							if(typeof b.x=="number"){
								a=b.y;
								b=b.x
							}else{
								a=b.height;
								b=b.width
							}
						}
					}
					return this.setStyles({
						width:b,
						height:a
					})
				},
				up:function(a){
					return this.getParent(a)
				}
			});
			Element._insertionTranslations={
				before:function(a,b){
					a.parentNode.insertBefore(b,a)
				},
				top:function(a,b){
					a.insertBefore(b,a.firstChild)
				},
				bottom:function(a,b){
					a.appendChild(b)
				},
				after:function(a,b){
					a.parentNode.insertBefore(b,a.nextSibling)
				},
				tags:{
					TABLE:["<table>","</table>",1],
					TBODY:["<table><tbody>","</tbody></table>",2],
					TR:["<table><tbody><tr>","</tr></tbody></table>",3],
					TD:["<table><tbody><tr><td>","</td></tr></tbody></table>",4],
					SELECT:["<select>","</select>",1]
				}
			};
			Hash.implement({
				find:function(d,c){
					var a;
					var b=d;
					if(c){
						b=b.bind(c)
					}
					this.some(function(g,f,h){
						if(b(g,f,h)){
							a=g;
							return true
						}
						return false
					});
					return a
				},
				inject:function(b,a){
					this.each(function(d,c,f){
						b=a(b,d,c,f)
					});
					return b
				},
				invoke:function(a){
					this.each(function(b){
						if(b[a]){
							b[a]()
						}
					});
					return this
				},
				ksort:function(c){
					var b=this;
					var a=$H({});
					this.getKeys().sort(c).each(function(d){
						a[d]=b[d]
					});
					return a
				},
				merge:function(a){
					return $H($merge(this.toObject(),a||{}))
				},
				sort:function(a){
					return this.toArray().sort(a)
				},
				toArray:function(){
					var a=[];
					this.each(function(b){
						a.push(b)
					});
					return a
				},
				toObject:function(){
					var a={};
					this.each(function(c,b){
						a[b]=c
					});
					return a
				}
			});
			Number.implement({
				isNaN:function(){
					return isNaN(this)
				},
				sgn:function(){
					if(this<0){
						return -1
					}else{
						if(this>0){
							return 1
						}
					}
					return 0
				}
			});
			String.implement({
				fromQueryString:function(b){
					var c=this;
					var a={};
					if(c.indexOf("?")!=-1){
						c=c.substr(c.indexOf("?")+1)
					}
					a=$H($A(c.split("&")).inject({},function(d,f){
						f=f.split("=");
						if(f.length==2){
							d[f[0]]=f[1]
						}
						return d
					}));
					if(a&&a.toObject&&b){
						a=a.toObject()
					}
					return a
				},
				leftPad:function(b,c){
					var a=new String(this);
					if(!c){
						c=" "
					}
					while(a.length<b){
						a=c+a
					}
					return a.toString()
				},
				stripTags:function(){
					return this.replace(/<\/?[^>]+>/gi,"")
				},
				substituteWithoutReplacingUndefinedKeys:function(a,b){
					return this.replace(b||(/\\?\{([^{}]+)\}/g),function(d,c){
						if(d.charAt(0)=="\\"){
							return d.slice(1)
						}
						return(a[c]!=undefined)?a[c]:"{"+c+"}"
					})
				},
				unescapeHtml:function(){
					var b=new Element("div");
					b.innerHTML=this.stripTags();
					if(!b.childNodes[0]){
						return""
					}
					if(b.childNodes.length>1){
						var a="";
						$A(b.childNodes).each(function(c){
							return a+c.nodeValue
						});
						return a
					}else{
						return b.childNodes[0].nodeValue
					}
				}
			});
			Element.NativeEvents=$extend(Element.NativeEvents,{
				touchstart:2,
				touchend:2,
				touchmove:2,
				touchcancel:2,
				gesturechange:2,
				gestureend:2
			});
			Browser.Engines.isChrome=function(){
				return Browser.Engine.webkit&&navigator.userAgent.toLowerCase().indexOf("chrome")!=-1
			};
			Browser.isIE9=Browser.Engine.trident&&Browser.Engine.trident6&&navigator.userAgent.toLowerCase().indexOf("msie 9.0")!=-1;
			if(Browser.Engine.trident){
				Element.implement({
					insertAtCursor:function(b,a){
						var d=this.getSelectedRange();
						if(d.start==0&&d.end==0){
							this.focus();
							sel=document.selection.createRange();
							sel.text=b;
							this.focus();
							return this
						}
						var c=this.get("value");
						this.set("value",c.substring(0,d.start)+b+c.substring(d.end,c.length));
						if($pick(a,true)){
							this.selectRange(d.start,d.start+b.length)
						}else{
							this.setCaretPosition(d.start+b.length)
						}
						return this
					},
					insertAroundCursor:function(b,a){
						b=$extend({
							before:"",
							defaultMiddle:"",
							after:""
						},b);
						var c=this.getSelectedText()||b.defaultMiddle;
						var h=this.getSelectedRange();
						if(h.start==0&&h.end==0){
							this.focus();
							sel=document.selection.createRange();
							sel.text=b.before+b.after;
							this.focus();
							return this
						}
						var g=this.get("value");
						if(h.start==h.end){
							this.set("value",g.substring(0,h.start)+b.before+c+b.after+g.substring(h.end,g.length));
							this.selectRange(h.start+b.before.length,h.end+b.before.length+c.length)
						}else{
							var d=g.substring(h.start,h.end);
							this.set("value",g.substring(0,h.start)+b.before+d+b.after+g.substring(h.end,g.length));
							var f=h.start+b.before.length;
							if($pick(a,true)){
								this.selectRange(f,f+d.length)
							}else{
								this.setCaretPosition(f+g.length)
							}
						}
						return this
					}
				})
			}
			(function(){
				var f="1.2.4";
				var s=false;
				var l=$A([]);
				var w=function(B){
					var C=B.split(".");
					return parseInt(C[0])*100000+parseInt(C[1])*1000+parseInt(C[2])
				};
				if(typeof MooTools=="undefined"||w(MooTools.version)<w(f)){
					throw ("jScroll requires the MooTools JavaScript framework >= "+f);
					return
				}
				var o=/jScroll\.js(\?.*)?$/;
				var c=null;
				var u=$$("head script[src]").find(function(B){
					if(c==null){
						c=B
					}
					return B.src.match(o)
				});
				if(u){
					u=u.src.replace(o,"")
				}else{
					u=c.src.replace(o,"")
				}
				var a=function(B){
					if(!s){
						window.addEvent("domready",function(){
							s=true;
							B()
						})
					}else{
						B.bind(window)()
					}
				};
				var x=function(B){
					if(B<0){
						B=0
					}else{
						if(B>100){
							B=100
						}
					}
					return B
				};
				var g=function(D){
					if($(document.body).getStyle("direction").toLowerCase()=="rtl"){
						D=D.replace(/left/g,"#left#");
						D=D.replace(/ltr/g,"#ltr#");
						D=D.replace(/right/g,"left");
						D=D.replace(/rtl/g,"ltr");
						D=D.replace(/#left#/g,"right");
						D=D.replace(/#ltr#/g,"rtl")
					}
					var B=function(){
						var E=/^[\s\n\r]+|[\s\n\r]+$/g;
						return function(F){
							return F.replace(E,"")
						}
					}();
					var C=function(E,I){
						if(E.indexOf(",")!=-1){
							E.split(",").each(function(J){
								C(B(J),I)
							});
							return
						}
						var H=$("jScroll.css");
						if(!H){
							var H=document.createElement("style");
							H.setAttribute("type","text/css");
							H.setAttribute("media","screen");
							H.setAttribute("id","jScroll.css");
							Element.insert(document.getElementsByTagName("head")[0],{top:H})
						}
						if(typeof I!="string"){
							var F="";
							$each(I,function(K,J){
								F+J.hyphenate()+":"+K,J
							});
							I=F
						}
						if(!Browser.Engine.trident||Browser.isIE9){
							H.appendChild(document.createTextNode(E+" {"+I+"}\n"))
						}
						if(Browser.Engine.trident&&document.styleSheets&&document.styleSheets.length>0&&!Browser.isIE9){
							var G=document.styleSheets[0];
							if(typeof(G.addRule)=="object"){
								G.addRule(E,I)
							}
						}
					};
					D.replace(/[\n\r]/gi,"").split("}").each(function(E){
						E=E.split("{");
						if(E.length<2||B(E[0])==0||B(E[1])==0){
							return
						}
						C(B(E[0]),B(E[1]))
					})
				};
				var d=function(B){
					B.container=$(B.container);
					if(!B.container||!B.container.nodeName||B.container.nodeType!=1){
						throw ("Missing scroll container for jScroll!")
					}
					if(B.container.tagName!="DIV"){
						throw ("invalid scroll container for jScroll! Can only be a div")
					}
					B.container._jScroll=B;
					b(B.container);
					if(z(B,"onRenderBefore")===false){
						return
					}
					if(B.rendered){
						return
					}
					B.rendered=true;
					B.container.setStyles({
						overflow:"hidden"
					});
					var D=B.container.getChildren();
					D.each(function(E){
						E.dispose()
					});
					B.container.innerHTML="";
					Element.insert(B.container,{
						bottom:'<div class="jScroll"><div class="jScroll-content"></div><div class="jScroll-scroll '+B.options.clsScroll+'"><div class="jScroll-scroll-up"><div class="'+B.options.clsUp+'"></div></div><div class="jScroll-scroll-between '+B.options.clsBetween+'"></div><div class="jScroll-scroll-slider '+B.options.clsSlider+'"><div class="'+B.options.clsSlider+' top"></div><div class="'+B.options.clsSlider+' center"></div><div class="'+B.options.clsSlider+' bottom"></div></div><div class="jScroll-scroll-between '+B.options.clsBetween+'"></div><div class="jScroll-scroll-down"><div class="'+B.options.clsDown+'"></div></div></div></div>'
					});
					B.element=B.container.down(".jScroll");
					B.elementContent=B.container.down(".jScroll-content");
					B.elementScroll=B.container.down(".jScroll-scroll");
					B.elementUp=B.container.down(".jScroll-scroll-up");
					B.elementUpBetween=B.container.down(".jScroll-scroll-between",0);
					B.elementSlider=B.container.down(".jScroll-scroll-slider");
					B.elementSliderTop=B.elementSlider.down(".top");
					B.elementSliderCenter=B.elementSlider.down(".center");
					B.elementSliderBottom=B.elementSlider.down(".bottom");
					B.elementDownBetween=B.container.down(".jScroll-scroll-between",1);
					B.elementDown=B.container.down(".jScroll-scroll-down");
					D.each(function(E){
						Element.insert(B.elementContent,{
							bottom:E
						})
					});
					var C=0;
					B.elementScroll.addEvent("mousedown",function(E){
						B._sliderScroll=true;
						E.stop();
						m(function(){
							if(y(B.elementSlider)<=C&&C<=y(B.elementSlider)+B.elementSlider.getSize().y){
								return
							}
							var F=C-y(B.elementSlider);
							if(F<0){
								B.elementUpBetween.addClass(B.options.clsBetweenClicked);
								B.elementDownBetween.removeClass(B.options.clsBetweenClicked)
							}else{
								B.elementUpBetween.removeClass(B.options.clsBetweenClicked);
								B.elementDownBetween.addClass(B.options.clsBetweenClicked)
							}
							B.scroll((F<0?-1:1)*B.stepLarge)
						},B)
					});
					B.elementUp.addEvent("mousedown",function(E){
						B._sliderScroll=true;
						E.stop();
						m(B.up.pass([B.stepSmall,B],B),B)
					});
					B.elementDown.addEvent("mousedown",function(E){
						B._sliderScroll=true;
						E.stop();
						m(B.down.pass([B.stepSmall],B),B)
					});
					B.elementSlider.addEvent("mousedown",function(E){
						E.stop();
						B._sliderMove=true;
						B._sliderY=E.page.y-parseFloat(B.elementSlider.getStyle("top"))+B.elementUp.getSize().y
					});
					document.addEvent("mousemove",function(F){
						C=F.page.y;
						if(!B._sliderMove){
							return
						}
						F.stop();
						var E=(F.page.y-B._sliderY)*100/B.sliderHeight;
						if(z(B,"onScrollSlideBefore",E)===false){
							return
						}
						B.update(E);
						z(B,"onScrollSlideAfter")
					});
					document.addEvent("mouseup",function(E){
						if(B._sliderMove||B._sliderScroll){
							E.stop();
							B._sliderMove=false;
							B._sliderScroll=false;
							A(B);
							B.elementUpBetween.removeClass(B.options.clsBetweenClicked);
							B.elementDownBetween.removeClass(B.options.clsBetweenClicked);
							B.elementDownBetween.removeClass(B.options.clsBetweenClicked)
						}
					});
					B.element.addEvent("mousewheel",function(E){
						E.stop();
						B.scroll(-E.wheel*(E.alt?B.stepSmall:B.stepLarge))
					});
					B.refresh();
					z(B,"onRenderAfter")
				};
				var z=function(C,B,E){
					if(typeof C.options[B]!="function"){
						return true
					}
					if(typeof E!="undefined"){
						E=x(E);
						if(C.current==E){
							return false
						}
						var G=C.options[B].pass([C,C.current,E])
					}else{
						var G=C.options[B].pass([C])
					}
					try{
						return G()
					}
					catch(D){
						if(Browser.Engine.gecko){
							var F=D.name+" in "+D.fileName+" #"+D.lineNumber+" : "+D.message
						}else{
							if(Browser.Engine.trindent){
								var F=D.name+" "+D.number+" : "+D.message
							}else{
								if(Browser.Engine.webkit){
									var F=D.name+" in "+D.sourceURL+" #"+D.line+" : "+D.message
								}else{
									var F=JSON.encode(D)
								}
							}
						}
						Travian.$d(F+" -> function: "+String(C.options[B]));
						return
					}
				};
				var m=function(C,B){
					A(B);
					C.bind(B)();
					B._pe=C.periodical(50,B)
				};
				var A=function(B){
					if(B._pe){
						$clear(B._pe)
					}
				};
				var b=function(B){
					l.push(B);
					return l
				};
				window.jScroll=new Class({
					current:0,
					container:null,
					element:null,
					elementContent:null,
					elementDown:null,
					elementScroll:null,
					elementSlider:null,
					elementUp:null,
					enabled:false,
					options:null,
					rendered:false,
					stepLarge:10,
					stepSmall:1,
					applyContent:function(B){
						this.elementContent.innerHTML="";
						Element.insert(this.elementContent,B);
						this.refresh();
						this.update();
						return this
					},
					down:function(B){
						if(typeof B=="undefined"){
							B=this.options.scrollSmall
						}
						if(z(this,"onScrollDownBefore",this.current+B)===false){
							return this
						}
						this.scroll(B);
						z(this,"onScrollDownAfter");
						return this
					},
					initialize:function(B){
						if(typeof B.container=="undefined"){
							throw ("Missing container in options for jScroll!")
						}
						this.container=B.container;
						this.options=B;
						this.options.clsBetween=this.options.clsBetween||"jScroll-element-between";
						this.options.clsBetweenClicked=this.options.clsBetweenClicked||"clicked";
						this.options.clsDown=this.options.clsDown||"jScroll-element-down";
						this.options.clsScroll=this.options.clsScroll||"jScroll-element-scroll";
						this.options.clsSlider=this.options.clsSlider||"jScroll-element-slider";
						this.options.clsUp=this.options.clsUp||"jScroll-element-up";
						this.options.lines=this.options.lines||10;
						this.options.alignRight=typeof this.options.alignRight!="undefined"?this.options.alignRight:"auto";
						if(!s){
							a(d.pass([this]))
						}else{
							d(this)
						}
					},
					insertContent:function(B){
						Element.insert(this.elementContent,B);
						this.refresh();
						this.update();
						return this
					},
					refresh:function(){
						var G=true;
						var E=null;
						var D=null;
						if(!this.rendered){
							return this
						}
						if(this.container.isDisplayed()===false){
							G=false;
							this.container.setStyles({
								display:"block"
							})
						}
						E=this.elementContent.getSize().y;
						D=parseInt(this.container.getStyle("max-height"));
						if(D>0){
							this.container.setStyles({
								height:E<=D?E:D
							})
						}
						this.elementContent.setStyles({
							height:"auto"
						});
						if(E<this.element.getSize().y){
							this.enabled=false;
							this.container.setStyles({
								overflow:""
							});
							this.elementScroll.hide();
							this.elementContent.setStyles({
								marginTop:0,
								right:""
							});
							if(G===false){
								this.container.setStyles({
									display:""
								})
							}
							return this
						}
						this.enabled=true;
						this.elementScroll.show();
						this.container.setStyles({
							overflow:"hidden"
						});
						if($(document.body).getStyle("direction").toLowerCase()=="ltr"){
							this.elementContent.setStyles({
								marginTop:0,
								right:this.options.alignRight=="auto"?this.elementScroll.getSize().x+"px":this.options.alignRight
							})
						}else{
							this.elementContent.setStyles({
								marginTop:0,
								left:this.options.alignRight=="auto"?this.elementScroll.getSize().x+"px":this.options.alignRight
							})
						}
						this.sliderTop=this.elementUp.getSize().y-q(this.elementUp,"tb");
						this.sliderHeight=this.elementScroll.getSize().y-this.elementUp.getSize().y-q(this.elementUp,"tb")-this.elementDown.getSize().y-q(this.elementDown,"tb");
						var C=this.element.getSize().y;
						var F=this.elementContent.getSize().y;
						this.contentHeight=F-C;
						this.stepSmall=C*100/(this.options.lines*F);
						this.stepLarge=this.stepSmall*this.options.lines;
						var B=(this.sliderHeight*C/F);
						if(B<this.elementSliderTop.getSize().y+this.elementSliderBottom.getSize().y){
							B=this.elementSliderTop.getSize().y+this.elementSliderBottom.getSize().y
						}
						this.elementSlider.setStyles({
							height:B,
							top:this.sliderTop
						});
						this.elementSliderCenter.setStyles({
							height:(B-this.elementSliderTop.getSize().y-this.elementSliderBottom.getSize().y)
						});
						this.elementContent.setStyles({
							height:"100%"
						});
						this.elementUpBetween.setStyles({
							top:this.sliderTop,
							height:0
						});
						this.elementDownBetween.setStyles({
							top:(this.sliderTop+this.sliderHeight*this.current/100+this.elementSlider.getSize().y),
							bottom:this.elementDown.getSize().y
						});
						this.sliderHeight-=B;
						if(G===false){
							this.container.setStyles({display:""})
						}
						return this
					},
					scroll:function(B){
						if(typeof B=="undefined"||B==0||(B<0&&this.current<=0)||(B>0&&this.current>=100)){
							return this
						}
						if(z(this,"onScrollBefore",this.current+B)===false){
							return this
						}
						this.current+=B;
						this.update();
						z(this,"onScrollAfter");
						return this
					},
					scrollTo:function(K){
						var I=this;
						var E=null;
						var B=false;
						var F="view";
						var H=0;
						if($type(K)=="element"){
							E=K
						}else{
							E=K.element;
							B=K.animate;
							F=K.position
						}
						E=$(E);
						if(!E||!E.getParents().find(function(L){
							return L==I.elementContent
						})){
							return this
						}
						var D=y(this.elementContent);
						var J=this.elementContent.getSize().y;
						var C=y(E);
						var G=E.getSize().y;
						switch(F){
							case"top":H=(C-D)*100/this.contentHeight;
							break;
							case"view":default:H=(C-D-this.sliderHeight/2)*100/this.contentHeight;
							break
						}
						if(z(this,"onScrollBefore",H)===false){
							return this
						}
						this.update(H,B);
						z(this,"onScrollAfter");
						return this
					},
					up:function(B){
						if(typeof B=="undefined"){
							B=this.options.scrollSmall
						}
						if(z(this,"onScrollUpBefore",this.current-B)===false){
							return this
						}
						this.scroll(-1*B);
						z(this,"onScrollUpAfter");
						return this
					},
					update:function(C,B){
						B=typeof B=="undefined"?false:B;
						if(!this.rendered||!this.enabled){
							return this
						}
						if(typeof C!="undefined"){
							this.current=C
						}
						this.current=x(this.current);
						z(this,"onUpdateBefore");
						this.elementSlider.setStyles({
							top:(this.sliderTop+this.sliderHeight*this.current/100)
						});
						if(B){
							new Fx.Morph(this.elementContent).start({
								marginTop:(-1*this.contentHeight*this.current/100)
							})
						}else{
							this.elementContent.setStyles({
								marginTop:(-1*this.contentHeight*this.current/100)
							})
						}
						this.elementUpBetween.setStyles({
							height:(this.sliderTop+this.sliderHeight*this.current/100-this.elementUp.getSize().y)
						});
						this.elementDownBetween.setStyles({
							top:(this.sliderTop+this.sliderHeight*this.current/100+this.elementSlider.getSize().y)
						});
						z(this,"onUpdateAfter");
						return this
					}
				});
				jScroll.$=function(C){
					var B=$(C);
					if(!B&&typeof C=="string"){
						B=l.find(function(D){
							return D.id==C
						})
					}else{
						if(B&&typeof B._jScroll!="undefined"){
							B=B._jScroll
						}else{
							if(B&&typeof B._jScroll=="undefined"){
								B=null
							}
						}
					}
					return(B?B:null)
				};
				var k=document.compatMode=="CSS1Compat";
				var r=function(F,H,G){
					var I=0,D,C;
					F=$(F);
					for(var E=0,B=H.length;E<B;E++){
						D=F.getStyle(G[H.charAt(E)]);
						if(D){
							C=parseInt(D,10);
							if(C){
								I+=(C>=0?C:-1*C)
							}
						}
					}
					return I
				};
				var h=function(C,B){
					C=$(C);
					return r(C,B,{
						l:"border-left-width",
						r:"border-right-width",
						t:"border-top-width",
						b:"border-bottom-width"
					})
				};
				var t=function(C){
					var D=null;
					C=$(C);
					var B=0;
					C.getChildren().each(function(F,E){
						if(F.nodeType!=1){
							if(E==0){
								D=F
							}
							return
						}
						F=$(F);
						if(D){
							B+=F.offsetTop-C.offsetTop;
							D=null
						}
						return B+F.getSize().y+j(F,"tb")
					});
					return B
				};
				var q=function(C,D,B){
					C=$(C);
					return B&&Browser.Engine.trident&&!k?0:(v(C,D)+h(C,D))
				};
				var j=function(C,B){
					C=$(C);
					if(!B){
						return{
							top:parseInt(C.getStyle("margin-top"),10)||0,
							left:parseInt(C.getStyle("margin-left"),10)||0,
							bottom:parseInt(C.getStyle("margin-bottom"),10)||0,
							right:parseInt(C.getStyle("margin-right"),10)||0
						}
					}else{
						return r(C,B,{
							l:"margin-left",
							r:"margin-right",
							t:"margin-top",
							b:"margin-bottom"
						})
					}
				};
				var v=function(C,B){
					C=$(C);
					return r(C,B,{
						l:"padding-left",
						r:"padding-right",
						t:"padding-top",
						b:"padding-bottom"
					})
				};
				var n=function(D){
					D=$(D);
					var F=D,E=document;
					if(F==E||F==E.body){
						var B,C;
						if(Browser.Engine.trident&&k){
							B=E.documentElement.scrollLeft||(E.body.scrollLeft||0);
							C=E.documentElement.scrollTop||(E.body.scrollTop||0)
						}else{
							B=window.pageXOffset||(E.body.scrollLeft||0);
							C=window.pageYOffset||(E.body.scrollTop||0)
						}
						return{
							left:B,
							top:C
						}
					}else{
						return{
							left:F.scrollLeft,
							top:F.scrollTop
						}
					}
				};
				var y=function(B){
					B=$(B);
					var W,S,Q,G,T=(document.body||document.documentElement);
					if(B==T){
						return 0
					}
					if(B.getBoundingClientRect){
						Q=B.getBoundingClientRect();
						G=n($(document.body));
						return Q.top+G.top
					}
					var D=0,R=0;
					W=B;
					var X=B.getStyle("position")=="absolute";
					while(W){
						$(W);
						D+=W.offsetLeft;
						R+=W.offsetTop;
						if(!X&&W.getStyle("position")=="absolute"){
							X=true
						}
						if(Browser.Engine.gecko){
							S=W;
							var C=parseInt(S.getStyle("borderTopWidth"),10)||0;
							var V=parseInt(S.getStyle("borderLeftWidth"),10)||0;
							D+=V;
							R+=C;
							if(W!=B&&S.getStyle("overflow")!="visible"){
								D+=V;
								R+=C
							}
						}
						W=W.offsetParent
					}
					if(Browser.Engine.webkit&&X){
						D-=T.offsetLeft;
						R-=T.offsetTop
					}
					if(Browser.Engine.gecko&&!X){
						var U=$(T);
						D+=parseInt(U.getStyle("borderLeftWidth"),10)||0;
						R+=parseInt(U.getStyle("borderTopWidth"),10)||0
					}
					W=B.parentNode;
					while(W&&W!=T){
						if(!Prototype.Browser.Opera||(W.tagName!="TR"&&$(W).getStyle("display")!="inline")){
							D-=W.scrollLeft;
							R-=W.scrollTop
						}
						W=W.parentNode
					}
					return R
				};
				a(function(){});
				window.addEvent("domready",function(){
					g(".jScroll {overflow: hidden; width: 100%; height: 100%;position:relative;}.jScroll .jScroll-content {position: absolute; top: 0px; left: 0px;}.jScroll .jScroll-scroll {cursor:pointer; position: absolute; height: 100%; right: 0px; top: 0px;}.jScroll .jScroll-scroll-up, .jScroll .jScroll-scroll-slider, .jScroll .jScroll-scroll-down, .jScroll .jScroll-scroll-between {position: absolute; width: 100%;}.jScroll .jScroll-scroll-slider {top: 10px; height: 50px;}.jScroll .jScroll-scroll-slider .top, .jScroll .jScroll-scroll-slider .center, .jScroll .jScroll-scroll-slider .bottom {width: 100%;}.jScroll .jScroll-scroll-between {}.jScroll .jScroll-scroll-down {bottom: 0px;}.jScroll .jScroll-element-scroll {width: 15px;}.jScroll .jScroll-element-down {background: transparent url("+u+"images/down.gif) no-repeat center bottom; height: 6px;}.jScroll .jScroll-element-down:hover {background-image: url("+u+"images/down-hover.gif);}.jScroll .jScroll-element-up {background: transparent url("+u+"images/up.gif) no-repeat center top; height: 6px;}.jScroll .jScroll-element-up:hover {background-image: url("+u+"images/up-hover.gif);}.jScroll .jScroll-element-between {margin-left: 4px; width: 7px; opacity: 0; background-color: #000000; filter: alpha(opacity=0);}.jScroll .jScroll-element-between:hover {opacity: 0.25; filter: alpha(opacity=25);}.jScroll .jScroll-element-between.clicked {opacity: 0.5; filter: alpha(opacity=50);}.jScroll .jScroll-element-slider .top {background: transparent url("+u+"images/slider-top.gif) no-repeat center top; height: 1px;}.jScroll .jScroll-element-slider:hover .top {background-image: url("+u+"images/slider-top-hover.gif);}.jScroll .jScroll-element-slider .center {background: transparent url("+u+"images/slider-center.gif) repeat-y center top;}.jScroll .jScroll-element-slider:hover .center {background-image: url("+u+"images/slider-center-hover.gif);}.jScroll .jScroll-element-slider .bottom {background: transparent url("+u+"images/slider-bottom.gif) no-repeat center bottom; height: 1px;}.jScroll .jScroll-element-slider:hover .bottom {background-image: url("+u+"images/slider-bottom-hover.gif);}")
				})
			})();
window.Travian={
	applicationId:"travian",
	emptyFunction:function(){},
	$d:function(b){
		if(Browser.Engine.gecko){
			console.info(b)
		}else{
			if(Browser.Engine.webkit){
				console.log(b)
			}else{
				if(Browser.Engine.presto){
					opera.postError(b)
				}else{
					if(Browser.Engine.trident&&window.console){
						if(typeof b=="object"){
							console.log(JSON.encode(b))
						}else{
							console.log(b)
						}
					}else{
						if(!$("travian_console")){
							var a=new Element("div",{
								id:"travian_console",
								styles:{
									position:"absolute",
									left:0,
									height:150,
									width:"100%",
									bottom:0,
									zIndex:10000,
									overflow:"auto",
									overflowX:"hidden",
									overflowY:"auto",
									borderTop:"1px solid #A06060",
									backgroundColor:"#FFD0D0",
									fontSize:"10px",
									fontFamily:"tahoma,arial,helvetica,sans-serif"
								}
							});
							(new Element("div",{
								html:"Console",
								styles:{
									fontWeight:"bold",
									padding:1,
									marginBottom:2,
									borderBottom:"1px solid #858484"
								}
							})).inject(a,"bottom");
							a.inject(document.body,"bottom")
						}
						(new Element("span",{
							html:b+"<br />"
						})).inject($("travian_console"),"bottom")
					}
				}
			}
		}
	},
	ajax:function(options){
		options=options||{};
		var fn={
			onRequest:options.onRequest||Travian.emptyFunction,
			onComplete:options.onComplete||Travian.emptyFunction,
			onCancel:options.onCancel||Travian.emptyFunction,
			onSuccess:options.onSuccess||Travian.emptyFunction,
			onFailure:options.onFailure||Travian.emptyFunction,
			onException:options.onException||Travian.emptyFunction
		};
		if(!options.url){
			options.url="ajax.php"
		}
		if(options.data&&options.data.cmd){
			options.url=options.url+(options.url.indexOf("?")==-1?"?":"&")+"cmd="+options.data.cmd
		}
		return new Request($merge(options,{
			method:"post",
			encoding:"utf-8",
			evalResponse:false,
			evalScripts:false,
			headers:{"X-Request":"JSON"},
			onRequest:function(){
				fn.onRequest(this)
			},
			onComplete:function(){
				if(!this.response.json){
					this.response.json=JSON.decode(this.response.text)
				}
				fn.onComplete(this.response.json.data)
			},
			onCancel:function(){
				fn.onCancel(this)
			},
			onSuccess:function(){
				if(!this.response.json){
					this.response.json=JSON.decode(this.response.text)
				}
				if(this.response.json.javascript){
					eval(this.response.json.javascript)
				}
				if(this.response.json.error){
					if(fn.onFailure(this.response.json.data,this.response.json.error)!==false){
						if(this.response.json.errorMsg==null){
							this.response.json.errorMsg="Ajax Request error and no text. That is not so good."
						}
						this.response.json.errorMsg.dialog()
					}
					return
				}else{
					if(this.response.json.reload){
						window.location.reload()
					}else{
						if(this.response.json.redirectTo){
							window.location.href=this.response.json.redirectTo
						}
					}
				}
				fn.onSuccess(this.response.json.data)
			},
			onFailure:function(){
				if(!this.response.json){
					this.response.json=JSON.decode(this.response.text)
				}
				if(this.response.json.error){
					if(fn.onFailure(this.response.json.data,this.response.json.error)!==false){
						if(this.response.json.errorMsg==null){
							this.response.json.errorMsg="Ajax Request error and no text. That is not so good."
						}
						this.response.json.errorMsg.dialog()
					}
					return
				}
				fn.onFailure(this.response.json.data)
			},
			onException:function(){
				fn.onException(this)
			}
		})).send()
	},
	getDirection:function(){
		if(!this.direction){
			this.direction=$(document.body).getStyle("direction").toLowerCase()
		}
		return this.direction
	},
	insertScript:(function(){
		var a=$A([]);
		var b=function(c){
			if(a.length==0){
				$$("script[src]").each(function(d){
					a.push({
						src:d.src,
						id:d.id,
						defer:d.defer,
						defaultURL:false
					})
				})
			}
			return a.find(function(d){
				return d.src==c.src
			})
		};
		return function(c){
			var f=this;
			if(!c){return}
			if(c&&c.$family&&c.$family.name=="array"){
				return $A(c).each(function(g){
					f.insertScript(g)
				})
			}
			if(typeof c=="string"){
				c={src:c}
			}
			c.onLoad=c.onLoad||this.emptyFunction;
			if(b(c)){
				c.onLoad(false);
				return true
			}
			a.push(c);
			var d=new Element("script",{
				id:(c.id?c.id:undefined),
				src:c.src,
				type:"text/javascript",
				defer:(c.defer?true:false)
			});
			if(Browser.Engine.trident){
				d.onreadystatechange=function(){
					if(d.readyState=="loaded"||d.readyState=="complete"||d.readyState==4){
						c.onLoad(true)
					}
				}
			}else{
				d.onload=c.onLoad.pass(true)
			}
			$(document.html).getElement("head").appendChild(d);
			return d
		}
	})(),
	popup:function(b,a){
		a=a||{};
		return window.open(b,a.id||"_blank",$H(a).getKeys().inject([],function(d,c){
			if(c!="id"){
				if($type(a[c])=="boolean"){
					a[c]=a[c]?"yes":"no"
				}
				d.push(c+"="+a[c])
			}
			return d
		}).join(","),true)
	},
	toggleSwitch:function(b,a){
		b.toggleClass("hide");
		a.toggleClass("switchClosed");
		a.toggleClass("switchOpened");
		return this
	}
};
Travian.Storage=(function(){
	var c=null;
	var d=function(m,l){
		var n=g(m);
		l=h(l);
		if(n===null){
		}else{
			n.removeItem(l)
		}
	};
	var a=function(m,l){
		return{
			data:m,
			time:(new Date()).getTime(),
			cachingTime:l
		}
	};
	var k=function(m,l){
		var o=g(m);
		var n=null;
		l=h(l);
		if(o===null){
			return null
		}else{
			n=o.getItem(l)
		}
		if(n==null||typeof n=="undefined"){
			return null
		}
		return JSON.decode(n)
	};
	var g=function(m){
		var l=m?"localStorage":"sessionStorage";
		if(!window[l]){
			return null
		}
		return window[l]
	};
	var b=function(){
		if(c===null){
			c=new Element("input",{type:"hidden"}).setStyles({behavior:"url(#default#userData)"}).inject(document.body)
		}
		return c
	};
	var h=function(l){
		return"Travian."+l
	};
	var f=function(m,l,n){
		var q=g(m);
		var o=JSON.encode(n);
		l=h(l);
		if(q===null){
			return null
		}else{
			q.setItem(l,o)
		}
	};
	var j=function(n,m){
		var l=n.cachingTime;
		if(typeof m.cachingTime!="undefined"&&m.cachingTime!==null){
			l=m.cachingTime
		}
		return m.time!==false&&(new Date()).getTime()-m.time>l
	};
	return{
		cachingTime:365*24*60*60*1000,
		clear:function(l,m){
			d(m,l);
			return this
		},
		get:function(l,m){
			var n=k(m,l);
			if(n===null){
				return null
			}
			if(j(this,n)===true){
				return null
			}
			return n.data
		},
		set:function(m,o,n,l){
			var q=a(this,o,l);
			f(n,m,q);
			return this
		}
	}
})();
Travian.Translation={
	keys:{},
	add:function(b,c){
		var a={};
		if(typeof b!="object"){
			a[b]=c
		}else{
			a=b
		}
		this.keys=$merge(this.keys,a);
		return this
	},
	get:function(a){
		return this.keys[a]
	},
	translate:function(c,b){
		var a=null;
		if(typeof b=="object"){
			a=$extend($clone(this.keys),b)
		}else{
			a=this.keys
		}
		return c.substituteWithoutReplacingUndefinedKeys(a)
	}
};
String.implement({
	translate:function(a){
		return Travian.Translation.translate(this,a)
	}
});
Travian.Tips=(function(){
	var c=function(d){
		var f={
			title:"",
			text:""
		};
		var g=d.split("||");
		if(g.length==1){
			f.text=g[0]
		}else{
			if(g.length==2){
				f.title=g[0];
				f.text=g[1]
			}else{
				return false
			}
		}
		return f
	};
	var b=function(d){
		$each(d,function(f){
			if(f.title!=""){
				var g=c(f.title);
				if(g===false){
					return
				}
				g.unescaped=true;
				f.setTip(g).removeAttribute("title");
				if(Browser.Engine.trident&&Browser.Engine.version<=5){
					f.setTip(g).removeAttribute("alt")
				}
			}
		})
	};
	var a=function(j){
		var g=window.getSize();
		var f=window.getScroll();
		var h={
			x:j.element.offsetWidth,
			y:j.element.offsetHeight
		};
		var d=$clone(j.mousePosition);
		d.x=j.mousePosition.x+j.options.offset.x;
		d.y=j.mousePosition.y+j.options.offset.y;
		if((d.x+h.x-f.x)>g.x-j.options.windowPadding.x){
			d.x=j.mousePosition.x-j.options.offset.x-h.x
		}
		if((d.y+h.y-f.y)>g.y-j.options.windowPadding.y){
			d.y=j.mousePosition.y-j.options.offset.y-h.y
		}
		if(d.x<j.options.windowPadding.x){
			d.x=j.options.windowPadding.x
		}
		if(d.y<j.options.windowPadding.y){
			d.y=j.options.windowPadding.y
		}
		j.element.setPosition(d)
	};
	window.addEvent("domready",function(){
		Travian.Tip=new Travian.Tips();
		b($$('[title!=""]'))
	});
	Element.set=Element.set.wrap(function(f,h,g){
		if(typeof h=="string"&&h=="title"){
			this.setTitle(g);
			return this
		}
		var d=f(h,g);
		if(typeof h=="string"&&h=="html"){
			b(this.select('[title!=""]'))
		}
		return d
	});
	Element.prototype.set=Element.prototype.set.wrap(function(f,h,g){
		if(typeof h=="string"&&h=="title"){
			this.setTitle(g);
			return this
		}
		var d=f(h,g);
		if(typeof h=="string"&&h=="html"){
			b(this.select('[title!=""]'))
		}
		return d
	}
);
Element.Prototype.set=Element.Prototype.set.wrap(function(f,h,g){
	if(typeof h=="string"&&h=="title"){
		this.setTitle(g);
		return this
	}
	var d=f(h,g);
	if(typeof h=="string"&&h=="html"){
		b(this.select('[title!=""]'))
	}
	return d
});
Element.implement({
	setTip:function(f){
		if(typeof f=="string"){
			var d=f;
			f=c(d);
			if(f===false){
				f=d
			}
		}
		Travian.Tip.set(this,f);
		return this
	},
	setTipUnescaped:function(f){
		if(typeof f=="string"){
			var d=f;
			f=c(d);
			if(f===false){
				f=d
			}
		}
		f.unescaped=true;
		Travian.Tip.set(this,f);
		return this
	},
	setTitle:function(d){
		return this.setTip(d)
	}
});
return new Class({
	Implements:[Options],
	displayState:"hide",
	element:null,
	elementCurrent:null,
	elementTitle:null,
	elementText:null,
	lastText:"",
	lastTitle:"",
	mousePosition:{x:0,y:0},
	options:{
		html:'<div class="tip"><div class="tip-container"><div class="tl"></div><div class="tr"></div><div class="tc"></div><div class="ml"></div><div class="mr"></div><div class="mc"></div><div class="bl"></div><div class="br"></div><div class="bc"></div><div class="tip-contents"><div class="title {title}"></div><div class="text {text}"></div></div></div></div>',
		hideDelay:250,
		maxWidthInPercent:0.33,
		offset:{x:16,y:16},
		showDelay:100,
		windowPadding:{x:10,y:10},
		zIndex:10000
	},
	timer:null,
	hide:function(){
		if(this.displayState!="hide"){
			this.displayState="hide";
			$clear(this.timer);
			this.element.get("tween").cancel();
			if(Browser.Engine.trident4){
				this.timer=(function(){
					this.setStyles({
						opacity:0,
						display:"none"
					})
				}).delay(this.options.hideDelay,this.element)
			}else{
				this.timer=this.element.fade.delay(this.options.hideDelay,this.element,"out")
			}
		}
		return this
	},
	initialize:function(d){
		this.setOptions(d);
		this.render()
	},
	render:function(){
		var d=this;
		this.element=(new Element("div",{
			styles:{
				position:"absolute",
				top:0,
				left:0,
				opacity:0,
				zIndex:this.options.zIndex
			}
		})).inject(document.body,"bottom").set("html",this.options.html.substitute({
			title:"elementTitle",
			text:"elementText"
		}));
		this.elementTitle=this.element.down(".elementTitle");
		this.elementText=this.element.down(".elementText");
		this.elementContainer=this.element.down(".tip-container");
		this.elementContents=this.element.down(".tip-contents");
		$(document.body).addEvents({
			mousemove:function(f){
				d.mousePosition.x=f.page.x;
				d.mousePosition.y=f.page.y;
				if(d.displayState!="show"){return}
				a(d)
			}
		});
		return this
	},
	set:function(d,f){
		var g=this;
						d=$(d);
						d._extendedTipContent=f;
						if(!d._extendedTip){
							d._extendedTip=true;
							d.addEvents({
								mouseenter:function(h){
									g.elementCurrent=d;
									g.show(d._extendedTipContent)
								},
								mouseleave:function(h){
									g.elementCurrent=null;
									g.hide()
								}
							})
						}
						d.setTitle=function(h){
							d._extendedTipContent=h;
							if(g.elementCurrent==d){
								g.show(d._extendedTipContent)
							}
						};
						return this
					},
					show:function(d){
						if(typeof d=="string"){
							d={
								title:"",
								text:d,
								unescaped:false
							}
						}
						if(!d.text&&!d.title){
							this.hide();
							return this
						}
						this.updateContent(d);
						if(this.displayState!="show"){
							this.displayState="show";
							$clear(this.timer);
							this.element.get("tween").cancel();
							if(Browser.Engine.trident4){
								this.timer=(function(f){
									this.setStyles({
										opacity:1,
										display:"block"
									})
								}).delay(this.options.showDelay,this.element)
							}else{
								this.timer=this.element.fade.delay(this.options.showDelay,this.element,"in")
							}
						}
						return this
					},
					updateContent:function(g){
						var f=$clone(g);
						var d=null;
						var h=null;
						if(typeof f.title=="undefined"||!f.title){
							f.title=""
						}
						if(typeof f.text=="undefined"||!f.text){
							f.text=""
						}
						f.title=f.title.translate();
						f.text=f.text.translate();
						if(this.lastText!=f.text||this.lastTitle!=f.title){
							if(typeof f.unescaped=="undefined"||f.unescaped!==true){
								f.title=f.title.unescapeHtml();
								f.text=f.text.unescapeHtml()
							}
							this.elementContainer.setStyles({
								width:"auto"
							});
							this.elementTitle.set("html",f.title);
							if(f.title){
								this.elementTitle.show()
							}else{
								this.elementTitle.hide()
							}
							this.elementText.set("html",f.text);
							if(f.text){
								this.elementText.show()
							}else{
								this.elementText.hide()
							}
							if(Browser.Engine.trident5&&Travian.getDirection()=="rtl"){
								this.elementContainer.setStyles({
									width:this.elementContents.getSize().x
								})
							}
							d=$(document.body).getSize().x;
							h=this.elementContents.getSize().x;
							if(Math.floor(d*this.options.maxWidthInPercent)<h){
								this.elementContainer.setStyles({
									width:Math.floor(d*this.options.maxWidthInPercent)
								})
							}
							this.elementContainer.setStyles({
								width:this.elementContainer.getSize().x
							});
							a(this);
							this.lastText=f.text;
							this.lastTitle=f.title
						}
						return this
					}
				})
			})();
			Travian.Translation.add({
				"allgemein.ok":"ok",
				"allgemein.cancel":"cancel"
			});
			Travian.Dialog=new Class({
				Implements:[Options,Events],
				options:{
					cssClass:"",
					buttonOk:true,
					buttonTextOk:null,
					buttonCancel:true,
					buttonTextCancel:null,
					elementFocus:"dialogButtonOk",
					maxWidthInPercent:0.75,
					moveable:true,
					relativeTo:null,
					scroll:true,
					title:null,
					useEscKey:true,
					disposeOnClose:true,
					submitMethod:null,
					submitUrl:null,
					fx:{
						type:"tween",
						open:1,
						close:0,
						options:{
							property:"opacity",
							duration:400
						}
					}
				},
				initialize:function(a){
					this.setOptions(a);
					this.options.relativeTo=this.options.relativeTo||document.body;
					this.ie6=Browser.Engine.trident&&Browser.Engine.version<=4;
					this.options.relativeTo=$(this.options.relativeTo);
					if(this.options.buttonTextOk==null){
						this.options.buttonTextOk=Travian.Translation.get("allgemein.ok")
					}
					if(this.options.buttonTextCancel==null){
						this.options.buttonTextCancel=Travian.Translation.get("allgemein.cancel")
					}
					this.render()
				},
				render:function(){
					var a=this;
					this.wrapper=new Element("div",{
						styles:{
							position:this.options.scroll&&!this.ie6&&document.body==this.options.relativeTo?"fixed":"absolute",
							zIndex:6000,
							opacity:0
						}
					}).inject(document.body).insert({
						top:'<div class="dialog '+this.options.cssClass+'"><div class="dialog-container"><div class="dialog-background-tl"></div><div class="dialog-background-tr"></div><div class="dialog-background-tc"></div><div class="dialog-background-ml"></div><div class="dialog-background-mr"></div><div class="dialog-background-mc"></div><div class="dialog-background-bl"></div><div class="dialog-background-br"></div><div class="dialog-background-bc"></div><div class="dialog-tl"></div><div class="dialog-tr"></div><div class="dialog-tc"></div><div class="dialog-ml"></div><div class="dialog-mr"></div><div class="dialog-mc"></div><div class="dialog-bl"></div><div class="dialog-br"></div><div class="dialog-bc"></div><div class="dialog-contents"><form action="?" method="get" accept-charset="UTF-8"><div class="iconButton delete small cancel"></div><div class="title"></div><div class="content"></div><div class="buttons"><button id="dialogButtonOk" class="ok" type="submit"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents"><div class="text"></div></div></div></button></div></form></div></div></div>'
					});
					this.content=this.wrapper.down(".content");
					this.title=this.wrapper.down(".title");
					this.setTitle(this.options.title);
					this.elementContainer=this.wrapper.down(".dialog-container");
					this.elementContents=this.wrapper.down(".dialog-contents");
					this.form = this.wrapper.down("form").addEvent("submit", function (b) {
							a.form.disabled ? b.stop() : (Browser.Engine && Browser.Engine.trident && (a.options.submitMethod || a.options.submitUrl) ? this.buttonOk.addClass("disabled").disabled = !0 : a.form.disabled = !0, a.fireEvent("okay", [a, a.content]), a.close(), a.options.submitMethod || b.stop())
						});
					this.form.disabled = !1;
					this.options.submitMethod && (this.form.setAttribute("method", this.options.submitMethod), this.options.submitUrl && this.form.setAttribute("action", this.options.submitUrl));
					this.buttonOk = this.wrapper.down("button.ok");
				this.options.buttonOk == !1 && this.buttonOk.hide().up(".buttons").hide();
				(this.buttonOkText = this.wrapper.down("button.ok .text")) ? this.buttonOkText.set("html", this.options.buttonTextOk) : this.buttonOk.setTitle(this.options.buttonTextOk);
				this.buttonCancel = this.wrapper.down(".cancel").addEvent("click", function () {
							a.fireEvent("cancel", [a, a.content]);
							a.close()
						});
					this.options.buttonCancel == !1 && this.buttonCancel.hide();
				(this.buttonCancelText = this.wrapper.down(".cancel .text")) ? this.buttonCancelText.set("html", this.options.buttonTextCancel) : this.buttonCancel.setTitle(this.options.buttonTextCancel);
				this.options.scroll && this.ie6 && window.addEvent("scroll", function () {
						a.update()
					});
					this.fireEvent("render", [this, this.content]);
				if (!this.fx) {
					this.fx = this.options.fx.type == "morph" ? new Fx.Morph(this.wrapper, this.options.fx.options) : new Fx.Tween(this.wrapper, this.options.fx.options)
				}
				this.fx.addEvent("complete", function () {
						if (a.open && $(a.options.elementFocus)) {
							try {
								$(a.options.elementFocus).focus()
							} catch (b) {}
						}
						a.fireEvent(a.open ? "show" : "hide", [a, a.content]);
						a.options.disposeOnClose && !a.open && a.dispose()
					});
				this.overlay=new Overlay(document.body,{
					onClick:function(){
						a.fireEvent("cancel",[a,a.content]);
						a.close()
					},
					opacity:0.3,
					duration:this.options.fx.options.duration
				})
			},
			setContent : function (a, b) {
				var c = null,
				d = null;
				this.content.empty();
				Browser.Engine && Browser.Engine.trident5 && Travian.getDirection() == "rtl" && this.elementContainer.setStyles({
						width : "auto"
					});
				this.content.set("html", a);
				Browser.Engine && Browser.Engine.trident5 && Travian.getDirection() == "rtl" && this.elementContainer.setStyles({
						width : this.elementContents.getSize().x
					});
				c = $(document.body).getSize().x;
				d = this.elementContents.getSize().x;
				Math.floor(c * this.options.maxWidthInPercent) < d && this.elementContainer.setStyles({
						width : Math.floor(c * this.options.maxWidthInPercent)
					});
				if (b) {
					this.options.elementFocus = b
				}
				$(this.options.elementFocus) && function () {
					try {
						$(this.options.elementFocus).focus()
					} catch (a) {}
				}
				.delay(50);
				this.update();
				return this
			},
			setTitle : function (a) {
				this.options.title = a;
				this.title.set("html", this.options.title);
				this.options.title || this.title.hide();
				return this
			},
			update : function () {
				var a = {
					x : 0,
					y : 0
				},
				b = $(document.body).getSize();
				this.wrapper.getStyle("position") != "fixed" && document.body == this.options.relativeTo && (a = $(document.body).getScroll());
				var c = this.wrapper.getDimensions({
							computeSize : !0
						}),
				d = $(this.options.relativeTo).getSize(),
				e = $(this.options.relativeTo).getPosition(),
				a = {
					left : a.x + e.x + d.x / 2 - c.width / 2,
					top : a.y + e.y + d.y / 2 - c.height / 2
				};
				if (a.left < 0) {
					a.left = 5
				}
				if (a.top < 0) {
					a.top = 5
				}
				if (Travian.getDirection() == "rtl" && a.left + c.width > b.x) {
					a.left = b.x - c.width - 5
				}
				this.wrapper.setStyles(a)
			},
			show : function () {
				var a = this;
				this.open = !0;
				this.fireEvent("open", [this, this.content]);
				this.update();
				this.fx.start(this.options.fx.open);
				this.overlay && this.overlay.open();
				this.options.useEscKey && document.id(document.body).addEvent("keydown", function (b) {
						b.key == "esc" && a.close()
					});
				return this
			},
			close : function () {
				this.open = !1;
				this.fireEvent("close", [this, this.content]);
				this.fx.start(this.options.fx.close);
				this.overlay && this.overlay.close();
				return this
			},
			dispose : function () {
				this.wrapper.destroy();
				this.overlay && this.overlay.overlay.destroy()
			},
			toElement : function () {
				return this.wrapper
			}
		});
			Element.implement({
				dialog:function(a){
					new Travian.Dialog(a).setContent(this.get("html")).show();
					return this
				}
			});
			String.implement({
				dialog:function(a){
					this.dialog=new Travian.Dialog(a).setContent(this).show();
					return this
				}
			});
			Travian.Dialog.Ajax=new Class({
				Extends:Travian.Dialog,
				options:{
					data:{}
				},
				initialize:function(a){
					this.parent(a);
					this.request()
				},
				request:function(){
					var a=this;
					Travian.ajax({
						data:this.options.data,
						onSuccess:function(b){
							a.setContent(b.html).setTitle(b.title).show()
						}
					});
					return this
				}
			});
			Hash.implement({
				dialog:function(a){
					new Travian.Dialog.Ajax($merge(this.toObject(),a||{}));
					return this
				}
			});
			Travian.AutoCompleter=new Class({
				Extends:Autocompleter.Request.JSON,
				initialize:function(c,b,a){
					var d=this;
					this.parent(c,b,$merge({
						minLength:2,
						maxChoices:10,
						width:"auto",
						postVar:"search",
						postData:{
							cmd:"autoComplete"
						},
						emptyChoices:function(){
							var f=new Element("li",{
								html:"{cropfinder.keine_ergebnisse}".translate()
							});
							f.inject(d.choices);
							d.showChoices()
						}
					},a||{}))
				}
			});
			Travian.ajax=Travian.ajax.wrap(function(b,a){
				if(!a.url){
					a.url="ajax.php"
				}
				return b(a)
			});
			Travian.Game={
				currentPage:window.location.href.split("/").pop().split(".php",2).shift(),
				eventJamHtml:null,
				version:4,
				worldId:null,
				ajaxUpdate:function(b,a){
					b=$(b);
					a=a||{};
					var c={
						onRequest:a.onRequest||Travian.emptyFunction,
						onComplete:a.onComplete||Travian.emptyFunction,
						onCancel:a.onCancel||Travian.emptyFunction,
						onSuccess:a.onSuccess||Travian.emptyFunction,
						onFailure:a.onFailure||Travian.emptyFunction,
						onException:a.onException||Travian.emptyFunction
					};
					if(!a.url){
						a.url="admin.php"
					}
					if(a.parameters&&a.parameters.cmd){
						a.url=a.url+(a.url.indexOf("?")==-1?"?":"&")+"cmd="+a.parameters.cmd
					}
					return new Request($merge(a,{
						method:"get",
						encoding:"utf-8",
						evalResponse:false,
						evalScripts:false,
						onRequest:function(){
							c.onRequest(this)
						},
						onComplete:function(){
							c.onComplete(this.response.text)
						},
						onCancel:function(){
							c.onCancel(this)
						},
						onSuccess:function(){
							b.set("html",this.response.text);
							c.onSuccess(this.response.text)
						},
						onFailure:function(){
							c.onFailure(this.response.text)
						},
						onException:function(){
							c.onException(this)
						}
					})).send()
				},
				gotoPage:function(c,d,a,b){
					Travian.ajax({
						data:{
							cmd:d,
							data:{
								page:c,
								entries:b
							}
						},
						onSuccess:function(f){
							$(a).set("html",f.result)
						}
					});
					return this
				},
				iPopup:function(a,b){
					('<iframe class="popup" frameborder="0" id="Frame" src="manual.php?typ='+b+"&amp;gid="+a+'" width="475" height="500" border="0" allowTransparency="true"></iframe>').dialog({
					title:"{allgemein.anleitung}".translate(),
					buttonOk:false
					});
					return false
				},
				PopupMap:function(y,z){
					('<iframe class="popup" frameborder="0" id="Frame" src="karte.php?d='+y+"&amp;c="+z+'" width="475" height="500" border="0" allowTransparency="true"></iframe>').dialog({
					title:"".translate(),
					buttonOk:false
					});
					return false
				},
				unitZoom:function(a){
					('<div class="zoomTop"></div><div class="zoomMiddle"><img src="img/x.gif" class="unitBig u'+a+'Big" /></div><div class="zoomBottom"></div>').dialog({
					buttonOk:false,
					cssClass:"unitZoom"
					});
					return false
				},
				showEditVillageDialog:function(f,b,d,c){
					var a=b+' <input type="text" id="villageNameInput" name="villageName" value="" maxlength="20" />';
					a.dialog({
						title:f,
						relativeTo:$("villageName"),
						buttonTextOk:d,
						onOkay:function(g,h){
							Travian.ajax({
								data:{
									cmd:"changeVillageName",
									name:$("villageNameInput").value,
									did:c
								},
								onSuccess:function(j){
									$("villageNameField").innerHTML=$("villageNameInput").value,
									$("currentVillage").innerHTML=$("villageNameInput").value
								}
							})
						},
						onOpen:function(g,h){
							h.down("#villageNameInput").value=$("villageNameField").innerHTML
						}
					});
					return this
				}
			};
			window.addEvent("domready",function(){
				initTimer("l1","lbar1");
				initTimer("l2","lbar2");
				initTimer("l3","lbar3");
				initTimer("l4","lbar4");
				initCounter();
				$$("*.dynamic_img").addEvents({
					mouseenter:function(){
						this.addClass("over")
					},
					mouseleave:function(){
						this.removeClass("over");
						this.removeClass("clicked")
					},
					mousedown:function(){
						this.removeClass("over");
						this.addClass("clicked")
					}
				})
			});
			Travian.Game.PageScroller=new Class({
				Implements:[Options],
				currentPage:1,
				pages:1,
				options:{
					classActive:"active",
					classEntry:"entry",
					elementList:null,
					elementBackground:null,
					elementPrev:null,
					elementNext:null,
					maxPerPage:8
				},
				initialize:function(a){
					var c=this;
					this.setOptions(a);
					var b=function(){
						c.elementList=$(c.options.elementList);
						c.elementPrev=$(c.options.elementPrev);
						c.elementNext=$(c.options.elementNext);
						c.elementBackground=$(c.options.elementBackground);
						c.resetBackground();
						c.elementEntries=c.elementList.select("."+c.options.classEntry);
						c.pages=Math.floor((c.elementEntries.length-1)/c.options.maxPerPage)+1;
						if(c.pages<=1){
							c.elementPrev.hide();
							c.elementNext.hide();
							c.elementBackground.addClass("none");
							return
						}
						if(c.elementEntries.length!=0){
							var d=c.elementEntries[0].getDimensions({
								computeSize:true
							});
							c.elementList.setStyles({
								height:d.totalHeight*c.options.maxPerPage
							})
						}
						c.elementEntries.find(function(g,f){
							if(g.hasClass(c.options.classActive)){
								c.currentPage=Math.floor(f/c.options.maxPerPage)+1;
								return true
							}
							return false
						});
						c.showPage(c.currentPage);
						c.elementPrev.addEvent("click",function(f){
							f.stop();
							c.prev()
						});
						c.elementNext.addEvent("click",function(f){
							f.stop();
							c.next()
						})
					};
					if(!$(this.options.elementList)){
						$(document).addEvent("domready",b)
					}else{
						b()
					}
				},
				next:function(){
					return this.showPage(this.currentPage+1)
				},
				prev:function(){
					return this.showPage(this.currentPage-1)
				},
				resetBackground:function(){
					this.elementBackground.removeClass("none back forward both");
					return this
				},
				showPage:function(a){
					var b=this;
					if(this.pages<=1){
						return this
					}
					if(a>this.pages){
						a=this.pages
					}else{
						if(a<1){
							a=1
						}
					}
					this.currentPage=a;
					this.elementPrev[this.currentPage!=1?"show":"hide"]();
					this.elementNext[this.currentPage!=this.pages?"show":"hide"]();
					b.resetBackground();
					if(this.currentPage!=1&&this.currentPage!=this.pages){
						this.elementBackground.addClass("both")
					}else{
						if(this.currentPage!=1){
							this.elementBackground.addClass("back")
						}else{
							if(this.currentPage!=this.pages){
								this.elementBackground.addClass("forward")
							}else{
								this.elementBackground.addClass("none")
							}
						}
					}
					this.elementEntries.each(function(d,c){
						var f=Math.floor(c/b.options.maxPerPage)+1;
						if(f==b.currentPage){
							d.show()
						}else{
							d.hide()
						}
					});
					return this
				}
			});
			Travian.Game.InputCoordinates=(function(){
				Element.inject=Element.inject.wrap(function(m,j,l,k){
					f(Travian.Game.InputCoordinates,j);
					return m(j,l,k)
				});
				Element.prototype.inject=Element.prototype.inject.wrap(function(l,k,j){
					f(Travian.Game.InputCoordinates,this);
					return l(k,j)
				});
				Element.insert=Element.insert.wrap(function(l,j,k){
					return f(Travian.Game.InputCoordinates,l(j,k))
				});
				Element.prototype.insert=Element.prototype.insert.wrap(function(k,j){
					return f(Travian.Game.InputCoordinates,k(j))
				});
				var f=function(k,j){
					var l={
						x:null,
						y:null
					};
					$(j).getElements(k.options.selector).each(function(m){
						if(m.hasClass(k.options.classNames.x)){
							l.x=m
						}
						if(m.hasClass(k.options.classNames.y)){
							l.y=m
						}
						if(l.x!=null&&l.y!=null){
							k.add(l);
							l.x=null;
							l.y=null
						}
					});
					return j
				};
				var d=function(k,j){
					var l=parseInt(j.value);
					if(l<k.options.range.min){
						j.value=k.options.range.min;
						l=k.options.range.min
					}else{
						if(l>k.options.range.max){
							j.value=k.options.range.max;
							l=k.options.range.max
						}
					}
					return l
				};
				var c=function(m,n,l){
					var q=l.value;
					var o=m.options.splitChars.find(function(r){
						return q.indexOf(r)!=-1
					});
					if(!o){
						return false
					}
					var k=q.split(o);
					if(k.length<=1){
						return false
					}
					var j=[k.shift(),k.join("")].map(function(r){
						r=g(m,r);
						if(r<m.options.range.min){
							r=m.options.range.min
						}else{
							if(r>m.options.range.max){
								r=m.options.range.max
							}
						}
						return parseInt(r)
					});
					if(typeof j[0]!="number"||typeof j[1]!="number"||j[0].isNaN()||j[1].isNaN()){
						return false
					}
					n.x.value=j[0];
					n.y.value=j[1];
					return true
				};
				var g=function(j,k){
					return k.split("").filter(function(m,l){
						return(m=="-"||!parseInt(m).isNaN())
					}).filter(function(m,l){
						return !(l>=1&&m=="-")
					}).join("")
				};
				var a=function(m,j,k,l){
					if(c(j,k,l)){
						m.stop();
						return
					}l.value=g(j,l.value)
				};
				var b=function(m,j,l,k){
					if(j.options.passThroughChars[m.code]){
						return
					}
					if(m.control){
						return
					}
					if(j.options.validChars[m.code]=="-"&&l.value.indexOf("-")!=-1&&l.getSelectionStart()!=0){
						m.stop();
						return
					}
					if(j.options.splitChars[m.code]){
						if(l.value.length!=0&&parseInt(l.value).isNaN()==false){
							if(Browser.Engine.presto){
								l.value=g(j,l.value)
							}(k||Travian.emptyFunction)()
						}
						m.stop();
						return
					}else{
						if(!j.options.validChars[m.code]){
							m.stop();
							return
						}
					}
				};
				var h=function(o,k,m,n,q,j){
					if(k.options.passThroughChars[o.code]){
						return
					}
					if(c(k,m,n)){
						if(Browser.Engine.presto){
							n.value=g(k,n.value)
						}
						(q||Travian.emptyFunction)();
						o.stop();
						return
					}
					if(o.control){
						return
					}
					o.stop();
					if((n.value.length>=1&&k.options.validChars[o.code]=="-")||(k.options.splitChars[o.code])||(!k.options.validChars[o.code])){
						return
					}
					var l=d(k,n);
					if(l.isNaN()){
						return
					}
					if((l.sgn()==-1&&k.options.range.min.toString().length==l.toString().length)||(l.sgn()>=0&&k.options.range.max.toString().length==l.toString().length)){
						if(Browser.Engine.presto){
							n.value=g(k,n.value)
						}
						(j||Travian.emptyFunction)();
						return
					}
				};
				return new (new Class({
					Implements:[Options],
					elements:[],
					options:{
						selector:"input[class~=coordinates]",
						classNames:{
							x:"x",
							y:"y"
						},
						range:{
							min:-400,
							max:400
						},
						splitChars:$H({
							226:"|",
							188:",",
							78:",",
							110:",",
							190:".",
							32:" "
						}),
						prefixChars:$H({
							109:"+",
							43:"+",
							109:"-",
							189:"-"
						}),
						validChars:$H({
							109:"-",
							189:"-",
							96:"0",
							97:"1",
							98:"2",
							99:"3",
							100:"4",
							101:"5",
							102:"6",
							103:"7",
							104:"8",
							105:"9",
							48:"0",
							49:"1",
							50:"2",
							51:"3",
							52:"4",
							53:"5",
							54:"6",
							55:"7",
							56:"8",
							57:"9"
						}),
						passThroughChars:$H({
							8:String.fromCharCode(8),
							9:String.fromCharCode(9),
							13:String.fromCharCode(13),
							36:String.fromCharCode(36),
							35:String.fromCharCode(35),
							37:String.fromCharCode(37),
							39:String.fromCharCode(39),
							46:String.fromCharCode(46)
						})
					},
					add:function(j){
						var l=this;
						j=$clone(j);
						if(!j.x||!j.y){
							return this
						}
						if(j.x._inputCoordinates&&j.y._inputCoordinates){
							return this
						}
						j.x._inputCoordinates=true;
						j.y._inputCoordinates=true;
						j.x.removeAttribute("maxlength");
						j.y.removeAttribute("maxlength");
						var k=null;
						j.x.addEvents({
							change:function(m){
								a(m,l,j,j.x)
							},
							keydown:function(m){
								b(m,l,j.x,function(){
									j.y.focus()
								});
								return
							},
							keyup:function(m){
								h(m,l,j,j.x,function(){
									j.y.focus()
								},
								function(){
									j.y.focus()
								})
							}
						});
						j.y.addEvents({
							change:function(m){
								a(m,l,j,j.y)
							},
							keydown:function(m){
								b(m,l,j.y)
							},
							keyup:function(m){
								h(m,l,j,j.y)
							}
						});
						return this
					},
					initialize:function(j){
						var k=this;
						this.setOptions(j);
						$(document).addEvent("domready",(function(){
							f(k,document.body)
						}))
					}
				}))
			})();
			Travian.Game.ColorPercent=(function(){
				var b=function(c){
					c=c.toUpperCase();
					if(c.substr(0,1)=="#"){
						c=c.substr(1)
					}
					if(c.length==3){
						c=c.substr(0,1)+c.substr(0,1)+c.substr(1,1)+c.substr(1,1)+c.substr(2,1)+c.substr(2,1)
					}
					if(c.length!=6){
						$result={
							red:255,
							green:255,
							blue:255
						}
					}else{
						$result={
							red:parseInt(c.substr(0,2),16),
							green:parseInt(c.substr(2,2),16),
							blue:parseInt(c.substr(4,2),16)
						}
					}
					$each($result,function(d,f){
						if(d<0){
							d=0
						}else{
							if(d>255){
								d=255
							}
						}
						$result[f]=d
					});
					return $result
				};
				var a=function(c){
					return"rgb({red}, {green}, {blue})".substitute(c)
				};
				return new (new Class({
					colorPercent:function(f,l,g,d){
						if(typeof d=="undefined"){
							d=false
						}
						f=Math.ceil(f);
						if(f<=0){
							return l
						}else{
							if(f>=100){
								return g
							}else{
								if(f==50&&d!==false){
									return d
								}
							}
						}
						var j=b(l);
						var h=b(g);
						var c=false;
						if(d!==false){
							c=b(d)
						}
						if(c!=false&&f<50){
							h=c;
							f=Math.round(f*100/50)
						}else{
							if(c!=false&&f>50){
								j=c;
								f=Math.round((f-50)*100/50)
							}
						}
						var k={
							red:h.red-j.red,
							green:h.green-j.green,
							blue:h.blue-j.blue
						};
						$each(k,function(n,m){
							if(n==0){
								k[m]=j[m]
							}else{
								k[m]=j[m]+Math.ceil(f*n/100)
							}
							if(k[m]<0){
								k[m]=0
							}else{
								if(k[m]>255){
									k[m]=255
								}
							}
						});
						return a(k)
					}
				}))
			})();
			Travian.Game.ColorPicker=new Class({
				Implements:[Options,Events],
				options:{
					colors:[],
					defaultColor:-1,
					className:"moocolorcheckbox",
					selectedClassName:"moocolorcheckbox_selected"
				},
				initialize:function(a,b){
					var c=this;
					this.setOptions(b);
					this.container=$(a);
					this.container.setStyle("overflow","hidden");
					this.container.addEvents({
						mouseenter:function(){
							c.fireEvent("mouseenter")
						},
						mouseleave:function(){
							c.fireEvent("mouseleave")
						}
					});
					this.draw();
					if(this.options.defaultColor>=0){
						this.selectColor(this.options.colors[this.options.defaultColor])
					}
					return this
				},
				addColor:function(a){
					if(!a){
						return this
					}
					this.options.colors.include(a);
					this.draw();
					return this.draw()
				},
				removeColor:function(a){
					if(!a){
						return this
					}
					this.options.colors.erase(a);
					return this.draw()
				},
				selectColor:function(a){
					if(!a){
						return this
					}
					var b=this;
					this.container.getElements("div.moocolorcheckbox-container").each(function(c){
						if(c.down(".entry").getStyle("background-color").toUpperCase()==a.toUpperCase()){
							b.fireEvent("change",[a,c]);
							c.addClass(b.options.selectedClassName)
						}else{
							c.removeClass(b.options.selectedClassName)
						}
					});
					return this
				},
				getContainer:function(){
					return this.container
				},
				draw:function(){
					var a=this;
					this.container.empty();
					this.options.colors.each(function(b,c){
						var f=new Element("div",{"class":a.options.className+" moocolorcheckbox-container"});
						var d=new Element("div",{"class":"entry"});
						d.set("html","&nbsp;").setStyles({"background-color":b}).inject(f);
						f.setStyles({"float":"left",cursor:"pointer"}).addEvents({
							click:function(){
								a.selectColor(b)
							},
							mouseenter:function(){
								a.fireEvent("mouseenter",[f])
							},
							mouseleave:function(){
								a.fireEvent("mouseleave",[f])
							}
						}).inject(a.container)
					});
					return this
				}
			});
			Travian.Game.ImagePicker=new Class({
				Implements:[Options,Events],
				options:{
					images:[],
					defaultImage:-1,
					className:"mooimagecheckbox",
					selectedClassName:"mooimagecheckbox_selected"
				},
				initialize:function(a,b){
					var c=this;
					this.setOptions(b);
					this.container=$(a);
					this.container.setStyle("overflow","hidden");
					this.container.addEvents({
						mouseenter:function(){
							c.fireEvent("mouseenter")
						},
						mouseleave:function(){
							c.fireEvent("mouseleave")
						}
					});
					this.draw();
					if(this.options.defaultImage>=0){
						this.selectImage(this.options.images[this.options.defaultImage])
					}
					return this
				},
				addImage:function(a){
					if(!a){
						return this
					}
					this.options.images.include(a);
					this.draw();
					return this.draw()
				},
				removeImage:function(a){
					if(!a){
						return this
					}
					this.options.images.erase(a);
					return this.draw()
				},
				selectImage:function(b){
					if(!b){
						return this
					}
					var a=this;
					this.container.getElements("div").each(function(c){
						var d=c.down("img")._src;
						if(d.toUpperCase()==b.toUpperCase()){
							a.fireEvent("change",[b,c]);
							c.addClass(a.options.selectedClassName)
						}else{
							c.removeClass(a.options.selectedClassName)
						}
					});
					return this
				},
				getContainer:function(){
					return this.container
				},
				draw:function(){
					var a=this;
					this.container.empty();
					this.options.images.each(function(c,b){
						var d=new Element("div",{"class":a.options.className});
						d.set("html",'<img src="'+c+'" alt="" />').down("img")._src=c;
						d.setStyles({"float":"left",cursor:"pointer"}).addEvents({
							click:function(){
								a.selectImage(c)
							},
							mouseenter:function(){
								a.fireEvent("mouseenter",[d])
							},
							mouseleave:function(){
								a.fireEvent("mouseleave",[d])
							}
						}).inject(a.container)
					});
					return this
				}
			});
			Travian.Game.Menu=new Class({
				initialize:function(a){
					var c=$(a);
					var b=this;
					c.getElements("a").each(function(f){
						var d=f.getParent(".normal");
						if(!d){
							return
						}
						d.addEvents({
							mouseenter:function(h){
								var g=b.getMorphContainer(h);
								if($type(g._fxMenu)&&g._fxMenu.cancel){
									g._fxMenu.cancel()
								}
								g._fxMenu=(new Fx.Morph(g,{
									duration:200,
									transition:Fx.Transitions.Sine.easeOut
								})).start({
									height:"38px",
									"margin-top":"0px"
								})
							},
							mouseleave:function(h){
								var g=b.getMorphContainer(h);
								if($type(g._fxMenu)&&g._fxMenu.cancel){
									g._fxMenu.cancel()
								}
								g._fxMenu=(new Fx.Morph(g,{
									duration:200,
									transition:Fx.Transitions.Sine.easeOut
								})).start({
									height:"30px",
									"margin-top":"8px"
								})
							}
						})
					})
				},
				getMorphContainer:function(b){
					var a=$(b.target);
					if(a.getParent(".container")){
						var a=a.getParent(".container")
					}
					return a
				}
			});
			Travian.Game.AddLine=new Class({
				Implements:[Options,Events],
				options:{
					insertAfterLastEntry:true,
					elements:{
						add:null,
						insert:null,
						table:null,
						template:null
					},
					entryCount:0,
					maxEntries:false,
					selectors:{
						add:".addLine.addElement",
						insert:".addLine.insertElement",
						template:".addLine.templateElement"
					}
				},
				getEntryCount:function(){
					return this.options.entryCount
				},
				initialize:function(a){
					var b=this;
					this.setOptions(a);
					if(!this.options.elements.table){
						throw"Table element for Travian.Game.AddLine is not definied"
					}
					this.options.elements.table=$(this.options.elements.table);
					$w("template add insert").each(function(c){
						if(!b.options.elements[c]){
							b.options.elements[c]=b.options.elements.table.down(b.options.selectors[c])
						}
						if(!b.options.elements[c]){
							throw'Element "'+c+'" for Travian.Game.AddLine is not definied'
						}
					});
					this.options.elements.add.addClass("addLine removeElement");
					this.options.elements.template=$(this.options.elements.template).cloneNode(true);
					this.options.elements.add.removeClass("addLine removeElement");
					this.options.elements.add.addEvent("click",function(g){
						var f=null;
						var d=null;
						var c=null;
						g.stop();
						b.fireEvent("addBefore",[b]);
						b.fireEvent("cloneBefore",[b]);
						f=b.options.elements.template.cloneNode(true);
						b.fireEvent("cloneAfter",[b,f]);
						d=f.select("label","input","textarea","button","select");
						b.fireEvent("insertBefore",[b,f]);
						d.each(function(h){
							if(h.tagName.toLowerCase()=="input"){
								if(h.type.toLowerCase()=="checkbox"||h.type.toLowerCase()=="radio"){
									h.tagName.checked=false
								}else{
									if(h.type.toLowerCase()=="text"||h.type.toLowerCase()=="password"){
										h.tagName.value=""
									}
								}
							}else{
								if(h.tagName.toLowerCase()=="select"){
									h.tagName.selectedIndex=-1
								}else{
									if(h.tagName.toLowerCase()=="textarea"){
										h.tagName.value=""
									}
								}
							}
							b.fireEvent("insertInputBefore",[b,f,h])
						});
						b.options.elements.insert.insert({
							after:f.setStyles({
								opacity:0
							})
						});
						c=f.down(".addLine.removeElement");
						if(c){
							c.insert({
								after:b.options.elements.add
							});
							c.dispose()
						}
						b.options.entryCount++;
						if(b.options.maxEntries!==false&&b.options.maxEntries==b.options.entryCount){
							b.options.elements.add.dispose();
							Travian.Tip.hide()
						}
						d.each(function(h){
							b.fireEvent("insertInputAfter",[b,f,h])
						});
						new Fx.Morph(f,{
							duration:400
						}).start({
							opacity:[0,1]
						});
						b.fireEvent("insertAfter",[b,f]);
						if(b.options.insertAfterLastEntry===true){
							b.options.elements.insert=f
						}
						b.fireEvent("addAfter",[b,f])
					})
				}
			});
			Travian.Game.AutoCompleter=new Class({
				Extends:Travian.AutoCompleter,
				initialize:function(b,a){
					this.parent(b,"ajax.php?cmd=autoComplete",a)
				}
			});
			Travian.Game.AutoCompleter.UserName=new Class({
				Extends:Travian.Game.AutoCompleter,
				initialize:function(a){
					this.parent(a,{
						postData:{
							type:"username"
						}
					})
				}
			});
			Travian.Game.AutoCompleter.VillageName=new Class({
				Extends:Travian.Game.AutoCompleter,
				initialize:function(a){
					this.parent(a,{
						maxChoices:20,
						postData:{
							type:"villagename"
						}
					})
				}
			});
			Travian.Game.Messages={};
			Travian.Game.Messages.Write={
				receivertext:"",
				initialize:function(){
					$("ally").addEvent("click",function(){				
						$("recipient").getElement("input").set("value","[ally]")
					});
					new Travian.Game.AutoCompleter.UserName("receiver");
					var a=false;
					$("receiver").up("form").addEvent("submit",function(b){
						b.stop();
						receivertext=$("receiver").get("value");
						Travian.ajax({
							data:{
								cmd:"checkRecipient",
								recipient:$("receiver").get("value")
							},
							onSuccess:function(){
								$("receiver").up("form").submit();
								a=true
							}
						})
					})
				},
				showAddressBook:function(a){
					var b=true;
					if(this.addressBookDialog){
						this.addressBookDialog.show()
					}else{
						this.addressBookDialog="".dialog({
							disposeOnClose:false,
							title:"{nachrichten.adressbuch}".translate(),
							buttonTextOk:"{allgemein.save}".translate(),
							submitMethod:"post",
							submitUrl:"nachrichten.php?t=1",
							onOpen:function(c,d){
								if(!b){
									return
								}
								b=false;
								$(a).removeClass("hide");
								$(a).inject(d);
								d.getElements("td.pla a").addEvent("click",function(f){
									c.close();
									$("recipient").getElement("input").set("value",$(f.target).get("text"));
									f.stop()
								})
							}
						}).dialog
					}
					return this
				}
			};
			Travian.Game.BBEditor=(function(){
				var a=function(c,d){
					if(c.nodeName.toLowerCase()=="img"){
						c=c.up("button");
						if(!c){
							c=c.up("a")
						}
					}
					var b=c.className.split(" ").find(function(f){
						if(f.indexOf(d)==0){
							return true
						}
						return false
					});
					if(b){
						b=b.substr(0,b.length-1).split("{");
						if(b.length==2){
							b=b[1]
						}else{
							b=null
						}
					}
					return b
				};
				return new Class({
					preview:null,
					textArea:null,
					id:null,
					Binds:["fetchPreview","showToolbarWindow","insertTag","insertSingleTag","insertSmilieTag","hideToolbarWindow","showPreview","hidePreview"],
					initialize:function(b){
						this.id=b;
						this.textArea=$(b);
						this.toolbar=$(b+"_toolbar");
						this.preview=$(b+"_preview");
						this.preview.setStyle("display","none");
						this.preview.addClass("preview");
						$(b+"_previewButton").addEvent("click",this.fetchPreview);
						$(b+"_resourceButton").addEvent("click",this.showToolbarWindow);
						$(b+"_smilieButton").addEvent("click",this.showToolbarWindow);
						$(b+"_troopButton").addEvent("click",this.showToolbarWindow);
						$(b).addEvent("click",this.hideToolbarWindow);
						this.addEvent($(b+"_toolbar"),this.insertTag);
						this.addEvent($(b+"_resources"),this.insertTag);
						this.addEvent($(b+"_smilies"),this.insertTag);
						this.addEvent($(b+"_troops"),this.insertTag)
					},
					addEvent:function(d,b){
						var c=d.getChildren();
						for(i=0;i<c.length;i++){
							if(a($(c[i]),"bbTag")){
								$(c[i]).addEvent("click",b)
							}
						}
					},
					insertTag:function(d){
						d.stop();
						this.hidePreview();
						if($(d.target).match("button")){
							var c=$(d.target)
						}else{
							var c=$(d.target.parentNode)
						}
						var b=a(c,"bbTag");
						switch(a(c,"bbType")){
							case"d":this.textArea.insertAroundCursor({
								before:"["+b+"]",
								after:"[/"+b+"]"
							});
							break;
							case"s":this.textArea.insertAtCursor(b,false);
							break;
							case"o":this.textArea.insertAtCursor("["+a(c,"bbTag")+"]",false);
							break
						}
					},
					showToolbarWindow:function(f){
						f.stop();
						var d=f.target;
						var c=$(this.id+"_"+a(d,"bbWin"));
						var b=true;
						if(c.getStyle("display")=="block"){
							b=false
						}
						this.hideToolbarWindow();
						if(b){
							c.fade("hide").fade("in");
							c.setStyle("display","block")
						}
					},
					hideToolbarWindow:function(b){
						if(b){
							b.stop()
						}
						var c=$(this.id+"_toolbarWindows").getChildren();
						for(i=0;i<c.length;i++){
							$(c[i]).setStyle("display","none")
						}
					},
					fetchPreview:function(c){
						c.stop();
						if(this.textArea.getStyle("display")=="none"||this.textArea.value.length<1){
							this.hidePreview();
							return
						}
						var b=new Request.JSON({
							method:"post",
							url:"/ajax.php?f=bb",
							data:{
								nl2br:1,
								target:this.id,
								text:this.textArea.value
							},
							onSuccess:this.showPreview
						});
						b.post()
					},
					showPreview:function(b){
						if(b.error==true){
							alert(b.errorMsg);
							return
						}else{
							this.preview.innerHTML=b.text;
							this.preview.setStyle("display","block");
							this.textArea.setStyle("display","none")
						}
					},
					hidePreview:function(){
						this.preview.setStyle("display","none");
						this.textArea.setStyle("display","inline")
					}
				})
			})();
			Travian.Game.GoldToSilver=(function(){
				var a=function(d,c,f){
					return(f>=1&&c>=f)
				};
				var b=function(c,d,f){
					return(f>=1&&f>=c.options.rateSilverToGold&&d>=f)
				};
				return new Class({
					Binds:["transfer","transferSilverToGold"],
					Implements:[Options],
					options:{
						elementInputGold:null,
						elementInputSilver:null,
						elementResultGold:null,
						elementResultSilver:null,
						gold:null,
						rateGoldToSilver:null,
						rateSilverToGold:null,
						silver:null,
						lastFocusedElement:null
					},
					initialize:function(c){
						this.setOptions(c);
						this.options.elementInputGold=$(this.options.elementInputGold);
						this.options.elementInputSilver=$(this.options.elementInputSilver);
						this.options.elementResultGold=$(this.options.elementResultGold);
						this.options.elementResultSilver=$(this.options.elementResultSilver);
						this.options.elementInputGold.addEvent("keyup",this.transfer);
						this.options.elementInputSilver.addEvent("keyup",this.transfer)
					},
					handleFocusChange:function(c){
						if(this.options.lastFocusedElement!=c){
							if(c!=this.options.elementInputGold){
								this.options.elementInputGold.value=""
							}else{
								this.options.elementInputSilver.value=""
							}
							this.options.lastFocusedElement=c
						}
					},
					transfer:function(h){
						this.handleFocusChange(h.target);
						var d=parseInt(this.options.elementInputGold.value);
						var g=parseInt(this.options.elementInputSilver.value);
						var c=this.options.gold;
						var f=this.options.silver;
						if($type(d)==false||a(this,c,d)==false){
							d=0
						}
						d=Math.floor(d*this.options.rateGoldToSilver)/this.options.rateGoldToSilver;
						f+=Math.floor(d*this.options.rateGoldToSilver);
						c-=d;
						if($type(g)==false||b(this,f,g)==false){
							g=0
						}
						g=Math.floor(g/this.options.rateSilverToGold)*this.options.rateSilverToGold;
						c+=Math.floor(g/this.options.rateSilverToGold);
						f-=g;
						c-=this.options.gold;
						f-=this.options.silver;
						if(c>0){
							c="+"+c
						}
						if(f>0){
							f="+"+f
						}
						this.options.elementResultGold.set("html",c);
						this.options.elementResultSilver.set("html",f);
						return this
					}
				})
			})();
			Travian.Game.RaidList={
				data:null,
				addSlot:function(b){
					var c=$("list"+b);
					var a=c.down("input[name=sort]").value;
					var d=c.down("input[name=direction]").value;
					window.location.href="build.php?gid=16&t=99&action=showSlot&lid="+b+"&sort="+a+"&direction="+d
				},
				editSlot:function(b,c){
					var d=$("list"+b);
					var a=d.down("input[name=sort]").value;
					var f=d.down("input[name=direction]").value;
					window.location.href="build.php?gid=16&t=99&action=showSlot&eid="+c+"&sort="+a+"&direction="+f
				},
				loadList:function(b,a,f){
					var d=this;
					var c=$("list"+b);
					c.down(".loading").toggleClass("hide");
					Travian.ajax({
						data:{
							cmd:"raidListSlots",
							lid:b,
							sort:a,
							direction:f
						},
						onComplete:function(){
							c.down(".loading").toggleClass("hide")
						},
						onSuccess:function(g){
							c.down(".listContent").set("html",g.html);
							d.data[b]=g.list;
							c.down("input[name=sort]").value=g.sort;
							c.down("input[name=direction]").value=g.direction
						}
					});
					return this
				},
				markAllSlotsOfAListForRaid:function(a,b){
					$each(this.data[a].slots,function(c){
						c.marked=b
					});
					$("list"+a).getElements(".markSlot").each(function(c){
						c.checked=b
					});
					this.updateTroopSummaryForAList(a);
					return this
				},
				markSlotForRaid:function(a,b,c,d){
					this.data[a].slots[b].marked=c;
					if(typeof d=="undefined"||d){
						this.updateTroopSummaryForAList(a)
					}
					return this
				},
				setData:function(a){
					this.data=a
				},
				sort:function(a,b){
					return this.loadList(a,b,this.data[a].directions[b]!="asc"?"asc":"desc")
				},
				toggleList:function(a){
					var b=$("list"+a);
					if(typeof this.data[a]=="undefined"){
						this.loadList(a)
					}
					Travian.toggleSwitch(b.down(".listContent"),b.down(".openedClosedSwitch"));
					return this
				},
				updateTroopSummaryForAList:function(b){
					var c=this;
					var a=$H(this.data[b].slots).inject([0,0,0,0,0,0,0,0,0,0,0],function(f,g){
						if(g.marked){
							for(var d=1;d<=10;d++){
								f[d]+=g.troops[d]
							}
						}
						return f
					});
					$("list"+b).getElements(".troopSelectionValue").each(function(f,d){
						if(a[d+1]>0){
							f.set("html",'<span class="{alert}">{selected}/{available}'.substitute({
								selected:a[d+1],
								available:c.data[b].troops[d+1],
								alert:a[d+1]>c.data[b].troops[d+1]?"alert":""
							})).up(".troopSelectionUnit").show()
						}else{
							f.up(".troopSelectionUnit").hide()
						}
					});
					return this
				}
			};
			Travian.Game.Reports={
				editRights:function(b,a){
					Travian.ajax({
						data:{
							cmd:"reportRightsGet",
							reportId:a.datas.reportId
						},
						onSuccess:function(d){
							a.datas=$merge(a.datas||{},d||{});
							var c='<div class="reports" id="editRights"><div><input type="checkbox" id="right1" /> {anonymOpponent}</div><div><input type="checkbox" id="right2" /> {anonymMyself}</div><div><input type="checkbox" id="right3" /> {hiddenOwnTroops}</div><div><input type="checkbox" id="right4" /> {hiddenOtherTroops}</div><div class="description">{description}<br /><textarea id="description"></textarea></div></div>';
							c.substitute(a.text).dialog({
								relativeTo:b,
								buttonTextOk:a.text.buttonTextOk,
								buttonTextCancel:a.text.buttonTextCancel,
								title:a.text.title,
								onOpen:function(f,g){
									$("right1").checked=a.datas.right1;
									$("right2").checked=a.datas.right2;
									$("right3").checked=a.datas.right3;
									$("right4").checked=a.datas.right4;
									$("description").innerHTML=a.datas.description
								},
								onOkay:function(f,g){
									Travian.ajax({
										data:{
											cmd:"reportRightsSet",
											data:$merge(a.datas,{
												right1:$("right1").checked,
												right2:$("right2").checked,
												right3:$("right3").checked,
												right4:$("right4").checked,
												description:$("description").value
											})
										}
									})
								}
							})
						}
					});
					return false
				}
			};
Travian.Game.Hero={};
Travian.Game.Hero.Editor=new Class({
	Implements:[Options],
	options:{
		attributes:null,
		element:null,
		command:null,
		attributes:null,
		urlHeroImage:null,
		elementHeroImage:null
	},
	hideAll:function(){
		var a=this.options.element.getElements(".attributes .container .infoOpen").removeClass("infoOpen");
		a.down(".headline").removeClass("switchOpened").addClass("switchClosed");
		this.options.element.getElements(".attributes .container .details").hide();
		if(Browser.Engine.trident&&Browser.Engine.version<=4){
			a.setStyles({
				height:"auto"
			})
		}
		return this
	},
	initialize:function(a){
		var c=this;
		this.setOptions(a);
		this.options.element=$(this.options.element);
		this.hideAll();
		this.options.element.getElements(".attributes .container .info").each(function(d){
			d.addEvent("click",function(){
				c.showAttribute(d)
			})
		});
		this.options.element.getElements(".attributes .container .attribute").addEvent("click",function(f){
			var g=parseInt(f.target.id.split("attribute_button_")[1]);
			var d=f.target.getParent(".info").id;
			c.options.attributes[d]=g;
			c.sendAction("show");
			f.stop()
		});
		var b=this.options.element.down("#save");
		if(b!=null){
			b.addEvent("click",function(d){
				c.sendAction("save",function(){
					$(c.options.elementHeroImage).src=c.options.urlHeroImage.substitute({
						time:(new Date()).getTime()
					})
				});
				d.stop()
			})
		}
		var b=this.options.element.down("#random");
		if(b!=null){
			b.addEvent("click",function(d){
				c.sendAction("random");
				d.stop()
			})
		}
		this.options.attributes=this.options.attributes;
		this.storeAttributesInInput(this.options.attributes)
	},
	sendAction:function(a,c){
		var b=this;
		Travian.ajax({
			data:{
				cmd:this.options.command,
				action:a,
				attribs:this.options.attributes
			},
			onSuccess:function(d){
				//$$(".hero_head .image").set("html",""+a+"");
				b.options.attributes=b.attributes;
				//b.storeAttributesInInput(b.attributes);
				(c||Travian.emptyFunction)()
			}
		});
		return this
	},
	showAttribute:function(c){
		this.hideAll();
		if(c.hasClass("infoOpen")){return}
		c.addClass("infoOpen");
		var a=c.down(".headline").removeClass("switchClosed").addClass("switchOpened");
		var b=c.down(".details").show();
		if(Browser.Engine.trident&&Browser.Engine.version<=4){
			b.setStyles({
				position:"absolute",
				left:0,
				top:a.getSize().y
			});
			c.setStyles({
				position:"relative",
				height:b.getSize().y+a.getSize().y
			})
		}
		return this
	},
	storeAttributesInInput:function(b){
		var a=this.options.element.down("input[name=attributes]");
		if(a!=null){
			a.set("value",escape(JSON.encode(b)))
		}
		return this
	}
});
Travian.Game.Hero.Inventory=new Class({
	Implements:[Options],
	dragStatus:false,
	items:[],
	options:{
		heroState:{},
		isInVillage:true,
		isDead:false,
		data:[],
		heroBodyHash:false,
		images:"img/hero/items/item{typeId}.png",
		text:{
			moveDialogDescription:"Anzahl der zu verschiebenden Items: {inputField}",
			useDialogDescription:"Anzahl der zu anwendenden Items: {inputField}",
			moveDialogTitle:"Verschieben!",
			useDialogTitle:"Anwenden!",
			useOneDialogTitle:"Soll dieser Gegenstand wirklich benutzt werden?",
			buttonOk:"Ok",
			buttonCancel:"Cancel"
		}
	},
	startDrop:false,
	createAndAddItem:function(a){
		this.items.include($merge({
			placeElement:undefined,
			html_id:"item_"+a.id
		},
		a||{}));
	return this
	},
	createDivs:function(){
		var a=this;
		var b=$("placeHolder");
		this.items.each(function(h,d){
			h.isUseable=(h.slot=="bag"||a.options.isInVillage);
			if(a.options.isDead&&!h.isUsableIfDead){
				h.isUseable=false
			}
			var g="";
			if(!h.isUseable){
				if(a.options.isDead){
					g=a.options.text.notMoveableTextDead
				}else{
					g=a.options.text.notMoveableText
				}
				g+="<br />"
			}
			g+=h.attributes.join("<br />");
			var f=(new Element("div",{
				id:"item_"+h.id,"class":"item item_"+h.typeId+" "+(h.isUseable?"":"disabled"),
				title:"("+h.amount+") "+h.name+"",
				html:'<div class="amount">'+h.amount+"</div>",
				styles:{
					position:"relative"
				},
				events:{
				click:function(){
					if(h.isUseable){
						Travian.Tip.hide();
						a.moveToMatchingPlace(this)
					}
				},
				mouseover:function(){
					if(h.isUseable){
						if(a.startDrop!=true){
							a.mark(h.slot)
						}
					}
				},
				mouseout:function(){
					if(h.isUseable){
						if(a.startDrop!=true){
							a.unMark(h.slot)
						}
					}
				}
			}
		}));
			if(h.attributes){
				f.setTip({
					unescaped:true,
					title:"("+h.amount+") "+h.name,
					text:g
				})
			}
			f.inject(b);
			f.item=h;
			var c=null;
			if(h.placeId==0){
				c=$(h.slot);
				f.addClass("onHero")
			}else{
				c=$("inventory_"+h.placeId)
			}
			a.moveToDrop(f,c.addClass(h.isUseable?"":"disabled"),true)
		});
		this.makeDraggable();
		$(this.options.elementHeroBody).src=this.options.urlBodyImage.substitute({
			heroBodyHash:this.options.heroBodyHash
		});
		return this
	},
	dialog:function(a){
		var d=this;
		var f=a.text;
		var c=a.amount;
		var b=a.calculate;
		delete (a.text);
		delete (a.amount);
		delete (a.calculate);
		a.onOpen=(a.onOpen||Travian.emptyFunction).wrap(function(l,k,m){
			var j=m.down("#amount");
			if(j){j.value=c}
			if(b){
				var g=m.down(b.selectorDisplayUseValue||".displayUseValue");
				var n=m.down(b.selectorDisplayAfterUse||".displayAfterUse");
				if(!g){
					throw'missing elementByItem in item dialog. Selector does not match "'+(b.selectorDisplayUseValue||".displayUseValue")+'"'
				}
				if(!n){
					throw'missing elementByItem in item dialog. Selector does not match "'+(b.selectorDisplayAfterUse||".displayAfterUse")+'"'
				}
				var h=function(q){
					q=parseInt(q);
					if(q.isNaN()||q<0){q=0}
					var o=q*b.valuePerItem;
					g.set("html",o);
					n.set("html",b.currentValue+o)
				};
				h(j.value);
				j.addEvent("keyup",function(o){
					h(j.value)
				})
			}
			return l(k,m)
		});
		a=$merge(a,{
			buttonTextOk:this.options.text.buttonOk,
			buttonTextCancel:this.options.text.buttonCancel
		});
		f.substitute({
			inputField:'<input class="text" id="amount" type="text" value="0" />'
		})
		.dialog(a);
		return this
	},
	
executeMovement:function(d,b,a){
	var c=this;
	Travian.ajax({
		data:{
			cmd:"heroInventory",
			id:d,
			drid:b,
			amount:a
		},
		onSuccess:function(j){
			c.options.heroState=$merge(c.options.heroState,j.heroState||{});
			if(j.heroBodyHash){
				c.options.heroBodyHash=j.heroBodyHash
			}
			c.items.each(function(m,l){
				$(m.html_id).dispose()
			});
			c.items=new Array();
			j.items.each(function(m,l){
				c.createAndAddItem(m)
			});
			$$(".inventory").each(function(l){
				l.dispose()
			});
			var k=j.inventorySize;
			if(j.heroData.freePoints>0){
				$$("div.hero_inventory .attribute .setPoint").show()
			}else{
				$$("div.hero_inventory .attribute .setPoint").hide()
			}
			for(var g=1,f=null;g<=k;g++){
				f=new Element("div",{
					id:"inventory_"+g,
					"class":"inventory draggable"
				});
				f.inject($("itemsToSale").down(".market"),"before")
			}
			c.createDivs();
			var h=$("attributes");
			$H(j.heroData).each(function(o,m){
				var n=h.down("."+m);
				if(n!=null){
					var q=n.down(".current");
					var r=n.down(".progress .bar");
					var t=n.down(".points");
					var l=n.getElements(".tooltip");
					if(n.hasClass("res")){
						var s=$("setResource").getElements(".resource label .current");
						s.each(function(v,u){
							v.set("html",o["resourceHero"+u])
						})
					}
					if(n.hasClass("tooltip")){
						l.push(n)
					}
					if(q&&q.down(".value")){
						q=q.down(".value")
					}
					if(typeof o.current!="undefined"&&q){
						q.set("html",o.current)
					}
					if(typeof o.percent!="undefined"&&r){
						r.setStyles({width:o.percent+"%"});
						if(typeof o.backgroundColor!="undefined"){
							r.setStyles({
								backgroundColor:o.backgroundColor
							})
						}
					}
					if(typeof o.points!="undefined"&&t){
						t.set("html",o.points)
					}
					if(typeof o.tooltip!="undefined"&&l.length){
						l.setTipUnescaped(o.tooltip)
					}
				}
			});
			h.down(".experience").down(".points").set("html",j.heroData.freePoints);
			if(h.down(".health")){
				h.down(".health").down(".value").set("html",j.heroData.health.percent);
				h.down(".health").down(".bar").setStyles({
					width:j.heroData.health.percent
				})
			}
			if(c.options.afterRequestCallback[j.itemTypeId]){
				c.options.afterRequestCallback[j.itemTypeId](c,c.options,a,j)
			}
		}
	});
	return this},
findFirstFreeInventory:function(){
	var a=null;
	$$(".inventory").each(function(b){
		if(b.getChildren().length==0&&a==null){a=b}
	});
	return a
},
hideHero:function(){
	Travian.ajax({
		data:{
			cmd:"heroHideShow",
			active:$("heroHideShow").checked?1:0
		},
		onSuccess:function(a){
			$("heroHideShow").checked=a.hideShow
		}
	});
return this},
initialize:function(a){
	var b=this;this.setOptions(a);
	this.options.data.each(function(c){
		b.createAndAddItem(c)
	});
	this.createDivs();
	$("heroHideShow").addEvent("click",this.hideHero);
	$$("input[name=resource]").addEvent("click",this.setResource)
},
isInventoryId:function(a){
	return a.substr(0,9)=="inventory"
},
makeDraggable:function(){
	var c=this;var a=$("drag_cont");
	var b=$$(".draggable");
	var d=$("text");
	$$(".item").each(function(f){
		if(f.item.isUseable==false){
			return
		}
		new Drag.Move(f,{
			droppables:b,
			container:a,
			handle:f,
			onDrop:function(g,h){
				Travian.Tip.hide();
				if(c.startDrop==true){
					if(g.item.slot!="bag"&&g.item.placeId==0){
						g.addClass("onHero")
					}
					if(!h){
						c.moveToDrop(g,g.item.placeElement,true)
					}else{
						if(h.id==g.item.slot||c.isInventoryId(h.id)){
							g.addClass("highlight");
							(function(){
								g.removeClass("highlight")
							})
							.delay(500);
							c.unMark(h);
							if(g.item.placeElement!=h){
								c.moveToDrop(g,h)
							}else{
								c.moveToDrop(g,g.item.placeElement,true)
							}
						}else{
							c.moveToDrop(g,g.item.placeElement,true)
						}
					}
					c.startDrop=false;
					g.removeClass("whileDragging")
				}return true
			},
			onLeave:function(g,h){},
			onEnter:function(g,h){
				if(h.id==g.item.slot||h.id.substr(0,9)=="inventory"){
					c.mark(h)
				}
			},
			onStart:function(g){
				c.startDrop=true;
				c.dragStatus=true;
				g.addClass("whileDragging").removeClass("onHero")
			}
		})
	});
return this},
mark:function(a){
	$(a).addClass("heroMarked");
return this},
moveItem:function(c,a,b){
	if(b){
		this.executeMovement(c.item.id,a.id,b)
	}else{
		Element.dispose(c).inject(a)
	}
	this.resetItemDrop(c);
	c.item.placeElement=a;
return this},
moveToDrop:function(k,d,f){
	var g=this;
	var a=null;
	var c={
		title:"",
		text:"",
		executeAfterOkay:true,
		show:true,
		onOpen:Travian.emptyFunction,
		onOkay:Travian.emptyFunction,
		onCancel:Travian.emptyFunction,
		relativeTo:k,amount:k.item.amount
	};
	var h=false;
	var b={
		title:"",
		text:""
	};
	var j=function(){
		if(!c.executeAfterOkay){
			g.resetItemDrop(k);
			return
		}
		var l;
		if(f){
			l=false
		}else{
			if(k.item.amount==1){
				l=1
			}else{
				if(h==true){
					l=$("amount").value
				}else{
					l=k.item.amount
				}
			}
		}
		g.moveItem(k,d,l)
	};
	if(f!=true&&!this.isInventoryId(d.id)&&((k.item.instant&&k.item.amount==1)||k.item.amount>1)){
		if(this.options.useOneDialogTitleCallbacks[k.item.typeId]){
			c=$merge(c,this.options.useOneDialogTitleCallbacks[k.item.typeId](k.item,this.options,c)||{})
		}
		h=true;
		if(k.item.instant){
			if(k.item.amount==1){
				b.title=this.options.text.useDialogTitle;
				b.text=this.options.text.useOneDialogTitle
			}else{
				b.title=this.options.text.useDialogTitle;
				b.text=this.options.text.useDialogDescription
			}
		}else{
			b.title=this.options.text.moveDialogTitle;
			b.text=this.options.text.moveDialogDescription
		}
		if(c.title==""){
			c.title=b.title
		}
		if(c.text==""){
			c.text=b.text
		}
		if(c.show){
			c.onOkay=(c.onOkay||Travian.emptyFunction).wrap(function(m,l,n){
				j(l,n);
				return m(l,n)
			});
			c.onCancel=(c.onCancel||Travian.emptyFunction).wrap(function(m,l,n){
				g.moveToDrop(k,k.item.placeElement,true);
				return m(l,n)
			});
			this.dialog(c)
		}
	}else{
		j()
	}
return this},
moveToMatchingPlace:function(b){
	if(this.dragStatus==false){
		var c=b.item.slot;
		if(b.item.placeElement==$(c)){
			var a=this.findFirstFreeInventory();
			this.moveToDrop(b,a)
		}else{
			this.moveToDrop(b,$(c))
		}
		this.unMark(c)
	}else{
		this.dragStatus=false
	}
return this},
resetItemDrop:function(a){
	a.setStyles({left:0,top:0});
return this},
setResource:function(){
	Travian.ajax({
		data:{
			cmd:"heroSetResource",
			resource:$("setResource").getElement("input[name=resource]:checked").value
		},
		onSuccess:function(c){
			if(c.tooltip){
				var b=$("attributes").down(".productionPoints");
				var a=b.getElements(".tooltip");
				if(b.hasClass("tooltip")){
					a.push(b)
				}
				if(typeof c.tooltip!="undefined"&&a.length){
					a.setTipUnescaped(c.tooltip)
				}
			}
		}
	});
return this},
	unMark:function(a){
		$(a).removeClass("heroMarked");
		return this
	}
});
var timer=new Object();
var counter_plus=new Object();
var counter_minus=new Object();
var clientTime=Math.round($time()/1000);
var in_reload=0;
var auto_reload=1;
var resources=new Object();
function t_format1(a){
	p=a.innerHTML.split(":");
	sek=p[0]*3600+p[1]*60+p[2]*1;
return sek}
function t_format2(d,g){
	var a,f,b,c;if(d>-2){
		a=Math.floor(d/3600);
		f=Math.floor(d/60)%60;
		b=d%60;
		c=a+":";
		if(f<10){
			c+="0"
		}
		c+=f+":";
		if(b<10){
			c+="0"
		}
		c+=b
	}else{
		c=g?"0:00:0?":(Travian.Game.eventJamHtml||"0:00:0?")
	}
return c}
	function initCounter(){
		var a=null;for(var b=1;;b++){
			a=document.getElementById("tp"+b);
			if(a!=null){
				counter_plus[b]=new Object();
				counter_plus[b].node=a;counter_plus[b].counter_time=t_format1(a)
			}else{
				break
			}
		}
		for(b=1;;b++){
			a=document.getElementById("timer"+b);
			if(a!=null){
				counter_minus[b]=new Object();
				counter_minus[b].node=a;
				counter_minus[b].counter_time=t_format1(a)
			}else{
				break
			}
		}
		executeCounter()
	}
	function executeCounter(){
		for(var a in counter_plus){
			time_elapsed=Math.round($time()/1000)-clientTime;
			div_time=t_format2(counter_plus[a].counter_time+time_elapsed);
			counter_plus[a].node.innerHTML=div_time
		}
		for(a in counter_minus){
			time_elapsed=Math.round($time()/1000)-clientTime;
			int_time=counter_minus[a].counter_time-time_elapsed;
			if(in_reload==0&&int_time<1){
				in_reload=1;
				if(auto_reload==1){
					setTimeout("document.location.reload()",1000)
				}else{
					if(auto_reload==0){
						setTimeout("mreload()",1000)
					}
				}
			}else{}
			div_time=t_format2(int_time);
			counter_minus[a].node.innerHTML=div_time
		}
		if(in_reload==0){
			window.setTimeout("executeCounter()",1000)
		}
	}
	function initTimer(b,l){
		var g=document.getElementById(b);
		var f=null;
		var d=null;
		var c=null;
		var j=null;
		var h=null;
		var k=null;
		if(g!=null){
			resources[b]=new Object();
			var a=g.innerHTML.match(/(\d+)\/(\d+)/);
			if(a!=null){
				f=a[0].split("/");
				d=parseInt(f[0]);
				c=parseInt(f[1]);
				j=resources.production[b];
				if(j!=0){
					h=$time();
					timer[b]=new Object();
					timer[b].start=h;
					timer[b].production=j;
					timer[b].start_res=d;
					timer[b].max_res=c;
					timer[b].min_res=0;
					timer[b].ms=3600000/j;
					timer[b].bar_name=l;
					k=100;
					if(timer[b].ms<k){
						timer[b].ms=k
					}
					timer[b].node=g;
					executeTimer(b)
				}else{
					timer[b]=new Object();
					resources[b].value=d
				}
			}
		}
	}
	function executeTimer(a){
		time_elapsed=$time()-timer[a].start;
		if(time_elapsed>=0){
			new_res=Math.round(timer[a].start_res+time_elapsed*(timer[a].production/3600000));
			if(new_res>=timer[a].max_res){
				new_res=timer[a].max_res
			}else{
				if(new_res<=timer[a].min_res){
					new_res=timer[a].min_res
				}else{
					window.setTimeout("executeTimer('"+a+"')",timer[a].ms)
				}
			}
			resources[a].value=new_res;
			timer[a].node.innerHTML=new_res+"/"+timer[a].max_res;
			var c=$(timer[a].bar_name);
			if(c){
				var b=Math.round(100*new_res/timer[a].max_res);
				b=Math.min(b,100);
				b=Math.max(0,b);
				c.setStyles({
					width:b+"%",
					backgroundColor:(new_res<timer[a].max_res?"#006900":"#CC0000")
				})
			}
		}
	}
	function mreload(){
		param="reload=auto";
		url=window.location.href;
		if(url.indexOf(param)==-1){
			if(url.indexOf("?")==-1){
				url+="?"+param
			}else{
				url+="&"+param
			}
		}
		document.location.href=url
	}
	function http_request(url,callback,method,post_data){
		if(method===undefined){
			method="GET"
		}
		var httprid;
		if(window.XMLHttpRequest){
			httprid=new XMLHttpRequest()
		}else{
			if(window.ActiveXObject){
				try{
					httprid=new ActiveXObject("Msxml2.XMLHTTP")
				}
				catch(e){
					try{
						httprid=new ActiveXObject("Microsoft.XMLHTTP")
					}
					catch(e){}
				}
			}else{
				throw"Can not create XMLHTTP-instance"
			}
		}
		httprid.onreadystatechange=function(){
			if(httprid.readyState==4){
				if(httprid.status==200){
					var content_type=httprid.getResponseHeader("Content-Type");
					content_type=content_type.substr(0,content_type.indexOf(";"));
					switch(content_type){
						case"application/json":callback((httprid.responseText==""?null:eval("("+httprid.responseText+")")))
						break;
						case"text/plain":case"text/html":callback(httprid.responseText);
						break;
						default:throw"Illegal content type"
					}
				}else{
					throw"An error has occurred during request"
				}
			}
		};
		httprid.open(method,url,true);
		if(method=="POST"){
			httprid.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8");
			var parameters=encode_querystring(post_data)
		}else{
			var parameters=null
		}
		httprid.send(parameters)
	}
	function encode_querystring(b){
		var a="";
		var d=true;
		for(var c in b){
			a+=(d?"":"&")+c+"="+window.encodeURI(b[c]);
			if(d){
				d=false
			}
		}
		return a
	}
	var attackSysbolState=new Array();
	function getAttackSymbolState(f){
		var d=attackSysbolState[f];
		if(!d){
			d=new Object();
			var c=0;
			var b=$("markSymbol_"+f).get("class");
			var a=b.substr(b.lastIndexOf("_")+1,11);
			switch(a){
				case"green":c=1;
				break;
				case"yellow":c=2;
				break;
				case"red":c=3;
				break;
				default:c=0;
				break
			}
			d.type=c;
			d.oldType=c;
			attackSysbolState[f]=d
		}
		return d
	}
	function drawAttackSymbol(b){
		var a=getAttackSymbolState(b);
		if(a.type==4){
			a.type=0
		}
		switch(a.type){
			case 1:color="Green";
			break;
			case 2:color="Yellow";
			break;
			case 3:color="Red";
			break;
			default:color="Grey";
			break
		}
		$("markSymbol_"+b).set("class","markAttack markAttack"+color)
	}
	function markAttackSymbol(b){
		var a=getAttackSymbolState(b);
		a.type++;
		drawAttackSymbol(b);
		if(a.isSaving!=true){
			a.isSaving=true;
			(function(){
				if(a.type!=a.oldType){
					var c=new Request.JSON({
						method:"post",
						url:"/ajax.php?f=vp&id="+b+"&state="+a.type,
						onSuccess:function(f){
							var d=getAttackSymbolState(f.id);
							d.isSaving=false;
							d.type=f.type;
							d.oldType=f.type;
							drawAttackSymbol(f.id)
						}
					});
					c.post()
				}else{
					a.isSaving=false
				}
			}).delay(1000)
		}
	}
	var quest={
		anmstep:false
	};
	window.addEvent("domready",function(){
		if(((quest.number===null&&Travian.Game.currentPage!="hero")&&typeof quest.lastparallel=="undefined")||(window.location.href.indexOf("questUpdate")!=-1)){
			qst_handle()
		}else{
			if(typeof quest.lastparallel!="undefined"){
				qst_showQuest(quest.lastparallel)
			}
		}
	});
	function rndstring(g,d){
		if(g===undefined){
			g=8
		}
		if(d===undefined){
			d=0.5
		}
		var f="0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
		var a="";
		for(var c=0;c<g;c++){
			var b=Math.floor((Math.random()+d)*0.5*f.length);
			a+=f.substring(b,b+1)
		}
		return a
	}
	function qst_genurl_parameter(){
		var b="f=qst";
		var a=(Math.abs(quest.number)+1)/(Math.abs(quest.last)+1);
		return b+"&qact="+rndstring(4,a)
	}
	function qst_genurl(){
		return"ajax.php?"+qst_genurl_parameter()
	}
	function qst_animate(){
		$(document.getElementById("ce")).set("html","");
		var a;
		if(quest.anmstep===false){
			a={
				step:{},
				source:{},
				current:{},
				target:{
					width:448,
					height:482,
					top:-1
				},
				fps:50,
				n:10,
				i:0,
				anm:{}
			};
			a.target[quest.rtl?"right":"left"]="0"
		}else{
			a=quest.anmstep;
			qst_popup(false)
		}
		a.anm=document.getElementById("anm");
		for(var b in a.target){
			a.source[b]=Number(a.anm.style[b].substr(0,a.anm.style[b].length-2));
			a.current[b]=a.source[b];
			a.step[b]=Math.round((a.target[b]-a.source[b])/a.n)
		}
		a.timeout=1000/a.fps;
		quest.cstep=a;
		quest.anmlock=true;
		window.setTimeout(anm_step,a.timeout)
	}
	function anm_apply(a){
		for(var b in a.target){
			a.anm.style[b]=a.current[b]+"px"
		}
	}
	function anm_iterate(a){
		a.i++;
		if(a.i==2){
			a.anm.style.visibility="visible"
		}
		for(var b in a.target){
			a.current[b]+=a.step[b]
		}
		return a
	}
	function qst_popup(a){
		if(a===undefined){
			a==false
		}
		var c=document.getElementById("ce");
		if(a){
			var d="{close}".translate();
			var b='<div class="popup3 quest"><a class="close" href="#" onclick="qst_handle()"><img src="img/x.gif" class="" title="'+d+'" alt="'+d+'" /></a><div class="questTop"></div><div class="questMiddle"><div id="popup3"></div></div><div class="questBottom"></div></div>';
			$(c).empty().set("html",b);
			qst_xlo();
			qst_wfm();
			fixPopup();
			ie6_fixselect(true);
			popupDragable()
		}else{
			$(c).set("html","");
			ie6_fixselect(false)
		}
	}
	function ie6_fixselect(d){
		if(Browser.Engine.trident&&Browser.Engine.version<=4){
			var a=d?"hidden":"visible";
			var c=document.getElementsByTagName("select");
			var f=c.length;
			for(var b=0;b<f;b++){
				c[b].style.visibility=a
			}
		}
	}
	function anm_step(){
		step=anm_iterate(quest.cstep);
		anm_apply(step);
		if(step.i<step.n){
			window.setTimeout("anm_step()",step.timeout)
		}else{
			step.anm.style.visibility="hidden";
			quest.anmlock=false;
			quest.cstep=false;
			if(quest.anmstep===false){
				step.current=step.target;
				step.target=step.source;
				step.source=step.current;
				anm_apply(step);
				step.i=0;
				qst_popup(true);
				quest.anmstep=step
			}else{
				quest.anmstep=false;
				if(quest.number>=quest.last||quest.altstep==9){
					$(document.getElementById("qge")).set("hmtl","")
				}
			}
		}
	}
	function qst_alt_timer(){
		var b=document.getElementById("qst_timer");
		if(b&&b.parentNode.style.display!="none"){
			if(!b.timestamp){
				b.timestamp=Math.round($time()/1000)+t_format1(b)
			}else{
				var a=b.timestamp-Math.round($time()/1000);
				if(a<0){
					b.parentNode.style.display="none";
					document.getElementById("qst_reshere").style.display="block"
				}else{
					$(b).set("html",
					t_format2(a))
				}
			}
			window.setTimeout(qst_alt_timer,1000)
		}
	}
	function qst_fhandle(){
		post_data={
			val:1
		};
		http_request(qst_genurl(),function(a){},"POST",post_data);
		qst_handle()
	}
	function qst_handle(){
		if(quest.anmlock){
			return false
		}
		quest.markup=false;
		if(quest.anmstep===false){
			http_request(qst_genurl(),function(a){
				for(var b in a){
					quest[b]=a[b]
				}
			})
		}
		qst_animate();
		if(quest.ar){
			auto_reload=quest.ar;
			quest.ar=undefined
		}
	}
	function qst_wfm(){
		var popup3=document.getElementById("popup3");
		if(!quest.markup||!popup3){
			if(!quest.anmlock){
				window.setTimeout("qst_wfm(true)",50)
			}
		}else{
			if(quest.js){
				eval(quest.js)
			}
			scr_upd(quest);
			$(popup3).empty().set("html",quest.markup);
			popupDragable();
			quest.markup=false;
			quest.msg=false
		}
	}
	function qst_weiter(){
		var b=new URI(window.location.href);
		var a=window.location.href.fromQueryString().extend(qst_genurl_parameter().fromQueryString());
		a.questUpdate=1;
		a.questNext=1;
		if(a.set_quest){
			delete (a.set_quest)
		}
		window.location.href="http://{host}/{file}?".substitute(b.parsed)+a.toQueryString()
	}
	function qst_xlo(){
		$("popup3").empty().set("html",'<img src="img/x.gif" class="xlo" alt=""/>')
	}
	function qst_enter(a){
		if(a===undefined){
			a=false
		}
		var b;
		if(a){
			b={
				x:document.getElementById("xCoordInputQuest").value,
				y:document.getElementById("yCoordInputQuest").value
			}
		}else{
			b={
				val:document.getElementById("qst_val").value
			}
		}
		qst_xlo();
		http_request(qst_genurl(),function(c){
			for(var d in c){
				quest[d]=c[d]
			}
		},"POST",b);
		qst_wfm()
	}
	function qst_enter_coords(){
		qst_enter(true)
	}
	function handleUnreadAtNavigationButton(d,b){
		var c=document.getElementById(d);
		if(c&&b){
			var a=$$("#"+d+" .bubble-content")[0];
			a.set("html",b);
			if(b>0){
				a.getParent().set("styles",{display:"block"})
			}else{
				a.getParent().set("styles",{display:"none"})
			}
		}
	}
	function scr_upd(a){
		var c=document.getElementById("qgei");
		if(c&&a.qgsrc){
			c.className=a.qgsrc
		}
		handleUnreadAtNavigationButton("n5",a.be);
		handleUnreadAtNavigationButton("n6",a.msg);
		if(a.cookie){
			var b=new Date();
			b.setTime(b.getTime()+300000);
			document.cookie="t3fw=1; expires="+b.toUTCString()+";"
		}
		if(a.fest&&Travian.Game.currentPage=="dorf2"){
			$("content").insert({bottom:a.fest})
		}
		window.setTimeout(qst_alt_timer,30)
	}
	function qst_showQuest(id){
		Travian.ajax({
			data:{
				cmd:"questP4",
				id:id
			},
			onSuccess:function(data){
				if(data.js){
					eval(data.js)
				}
				if(document.getElementById("popup3")==null){
					quest.markup=data.html;
					quest.reward="";
					qst_animate()
				}else{
					$("popup3").set("html",data.html)
				}
			}
		});
		return false
	}
	function popupDragable(){
		if($("drag")){
			return
		}
		$$(".popup3")[0].grab(new Element("div",{id:"drag"}),"top").makeDraggable({handle:"drag"})
	}
	function fixPopup(){
		var a=$(window.document).getCoordinates();
		if(Browser.Engine.trident4&&(a.height<700||a.width<700)){
			$("ce").setStyles({
				position:"absolute"
			});
			is_too_small=true
		}else{
			$("ce").setStyles({position:"fixed"});
			is_too_small=false
		}
	}
	Travian.Game.Map=(function(){
		var a=0;
		return{
			Containers:null,
			debug:false,
			version:1,
			getNewId:function(){
				a++;
				return"mapId"+a
			},
			isMapPositionInRect:function(d,b){
				if(d.x0<=b.x&&d.y0<=b.y&&b.x<=d.x1&&b.y<=d.y1){
					return true
				}
				var c={
					x:b.x+(b.x<0?+801:-801),
					y:b.y+(b.y<0?+801:-801)
				};
				if(d.x0<=b.x&&d.y0<=b.y&&b.x<=d.x1&&b.y<=d.y1){
					return true
				}
				return false
			},
			isPositionInRect:function(c,b){
				return(c.x0<=b.x&&c.y0<=b.y&&b.x<=c.x1&&b.y<=c.y1)
			},
			register:function(b){
				if(this.debug){
					if(this.Containers==null){
						this.Containers=$A([])
					}
					this.Containers.push(b)
				}
			},
			remapShortParameters:function(b){
				if(typeof b.x!="undefined"&&typeof b.y!="undefined"){
					b.position={
						x:b.x,
						y:b.y
					};
					delete (b.x);
					delete (b.y)
				}
				if(typeof b.s!="undefined"){
					b.symbols=b.s;
					delete (b.s)
				}
				if(typeof b.c!="undefined"){
					b.title=b.c;
					delete (b.c)
				}
				if(typeof b.t!="undefined"){
					b.text=b.t;
					delete (b.t)
				}
				if(typeof b.u!="undefined"){
					b.uid=b.u;
					delete (b.u)
				}
				if(typeof b.d!="undefined"){
					b.did=b.d;
					delete (b.d)
				}
				if(typeof b.a!="undefined"){
					b.aid=b.a;
					delete (b.a)
				}
				return b
			},
			xy2id:function(c,b){
				if(c>400){
					c-=801
				}else{
					if(c<-400){
						c+=801
					}
				}
				if(b>400){
					b-=801
				}else{
					if(b<-400){
						b+=801
					}
				}
				$id=(400+c)+(400-b)*801+1;
				if($id<1||$id>641601){
					$id=320801
				}
				return $id
			}
		}
	})();
	Travian.Game.Map.Base=new Class({
		contextMenu:null,
		id:null,
		globalProperties:$A(["cookie","dataStore","transition","updater","contextMenu"]),
		element:null,
		options:null,
		parentContainer:null,
		transition:null,
		classType:"Travian.Game.Map.Base",
		updater:null,
		destroy:function(){
			if(this.element){
				this.element.destroy()
			}
		},
		getMapCoordinates:function(){
			if(!this.position||!this.transition){
				return null
			}
			return this.transition.translateToMap(this.position)
		},
		initialize:function(a,c){
			a=Travian.Game.Map.remapShortParameters(a);
			var b=this;
			this.options=$merge({},a);
			$each(this.options,function(f,d){b[d]=f});
			if(this.id==null){
				this.id=Travian.Game.Map.getNewId()
			}
			if(c){
				this.parentContainer=c;
				this.globalProperties.each(function(d){
					if(b.parentContainer[d]){
						b[d]=b.parentContainer[d]
					}
				});
				if(c.classType=="Travian.Game.Map.Container"){
					this.mapContainer=c
				}else{
					if(c.mapContainer){
						this.mapContainer=this.parentContainer.mapContainer
					}
				}
			}
		},
		isMapPositionInRect:function(a){
			if(!this.mapCoordinates||!a){
				return false
			}
			var b=$clone(this.mapCoordinates);
			if(!b.right){
				b.right=b.x
			}
			if(!b.bottom){
				b.bottom=b.y
			}
			return(b.x<=a.x&&b.y<=a.y&&a.x<=b.right&&a.y<=b.bottom)
		},
		isPositionInRect:function(a){
			return Travian.Game.Map.isPositionInRect({
				x0:this.position.x,
				y0:this.position.y,
				x1:this.position.x+this.position.width,
				y1:this.position.y+this.position.height
			},a)
		},
		render:function(a){
			a=a||{};
			if(!a.nodeType){
				a.nodeType="div"
			}
			this.element=(new Element(a.nodeType)).disableSelection();
			return this
		}
	});
	Travian.Game.Map.Container=(function(){
		var a=function(c){
			var g=false;
			var b=false;
			var m=null;
			var j=false;
			var h={
				count:0,
				shift:false,
				control:false,
				alt:false,
				keys:{},
				fn:null
			};
			var d={
				moved:false,
				x:null,
				y:null,
				target:null
			};
			$each(c.keyboard,function(q,o){
				if(typeof c.keyboard[o]=="string"){
					c.keyboard[o]={
						fn:c.keyboard[o]
					}
				}
				c.keyboard[o]=$extend({
					on:$A(["keydown","keyup"]),
					periodical:1
				},
				c.keyboard[o]);
				if(typeof c.keyboard[o].fn=="string"){
					h.keys[o]=false
				}
			});
			var n=c.containerRender.getStyle("cursor");
			var l=function(r,o,s,q){
				if(!c.isEventsEnabled()){
					return
				}
				if(c.containerViewSize.x<=o&&c.containerViewSize.y<=s&&o<=c.containerViewSize.right&&s<=c.containerViewSize.bottom&&q==c.containerMover&&!r.rightClick){
					g=true;
					b=false;
					m={
						x:o,
						y:s
					};
					r.stop()
				}
			};
			var f=function(q,o,s){
				if(c.containerViewSize.x<=o&&c.containerViewSize.y<=s&&o<=c.containerViewSize.right&&s<=c.containerViewSize.bottom){
					c.currentMousePosition.browserAbsolute.x=o;
					c.currentMousePosition.browserAbsolute.y=s;
					c.currentMousePosition.browser.x=o-c.containerSize.x-c.elementSize.x;
					c.currentMousePosition.browser.y=s-c.containerSize.y-c.elementSize.y;
					c.currentMousePosition.map=c.transition.translateToMap(c.currentMousePosition.browser)
				}else{
					c.currentMousePosition.browserAbsolute.x=null;
					c.currentMousePosition.browserAbsolute.y=null;
					c.currentMousePosition.browser.x=null;
					c.currentMousePosition.browser.y=null;
					c.currentMousePosition.map.x=null;
					c.currentMousePosition.map.y=null
				}
				if(!g){
					return
				}
				if(!c.isEventsEnabled()){
					return
				}
				var r={
					x:o-m.x,
					y:-(s-m.y)
				};
				m={
					x:o,
					y:s
				};
				b=true;
				c.containerRender.setStyles({cursor:"move"});
				c.move(r);
				q.stop()
			};
			var k=function(q,o,s){
				if(!c.isEventsEnabled()){return}
				if(o!=null&&s!=null&&c.containerViewSize.x<=o&&c.containerViewSize.y<=s&&o<=c.containerViewSize.right&&s<=c.containerViewSize.bottom&&!q.rightClick&&!b&&g&&!j){
					var r=c.transition.translateToMap({
						x:o-c.containerViewSize.x-c.elementSize.x,
						y:s-c.containerViewSize.y-c.elementSize.y
					});
					if(c.tileDisplayInformation.type=="dialog"){
						j=true;
						new Travian.Dialog.Ajax($merge(c.tileDisplayInformation.optionsDialog,{
							data:{
								x:r.x,
								y:r.y
							},
							onOpen:function(u,t){
								$(t).getElements('a[href^="karte.php"]').addEvent("click",function(w){
										w.stop();
										var v=new URI(w.target.href);
										c.moveTo({
											x:parseInt(v.getData("x")),
											y:parseInt(v.getData("y"))
										});
										u.close();
										return false
									})
								},
								onClose:function(){
									j=false
								}
							}))
						}else{
							Travian.popup(c.tileDisplayInformation.optionsPopup.url.substitute(r),c.tileDisplayInformation.optionsPopup.windowOptions)
						}
					}
					c.containerRender.setStyles({cursor:n});
					if(b){
						q.stop()
					}
					g=false;
					b=false
				};
				$(document).addEvents({
					selectstart:function(o){
						if(!c.isEventsEnabled()){
							return
						}
						if(!b){
							return
						}
						o.stop();
						return false
					},
					dragstart:function(o){
						if(!c.isEventsEnabled()){
							return
						}
						if(!b){
							return
						}
						o.stop();
						return false
					},
					mousedown:function(o){
						l(o,o.page.x,o.page.y,o.target)
					},
					mousemove:function(o){
						f(o,o.page.x,o.page.y)
					},
					mouseup:function(o){
						k(o,o.page.x,o.page.y)
					},
					mousewheel:function(o){
						if(!c.isEventsEnabled()){
							return
						}
						if(c.containerViewSize.x<=o.page.x&&c.containerViewSize.y<=o.page.y&&o.page.x<=c.containerViewSize.right&&o.page.y<=c.containerViewSize.bottom&&o.target==c.containerMover){
							var q=c.transition.translateToMap({
								x:o.page.x-c.containerViewSize.x-c.elementSize.x,
								y:o.page.y-c.containerViewSize.y-c.elementSize.y
							});
							if(o.wheel<0){
								c.zoomOut(q)
							}else{
								if(o.wheel>0){
									c.zoomIn(q)
								}
							}
							o.stop()
						}
					},
					touchstart:function(o){
						d.moved=false;
						d.x=o.event.touches[0].pageX;
						d.y=o.event.touches[0].pageY;
						d.target=o.event.touches[0].target;
						l(o,d.x,d.y,d.target)
					},
					touchmove:function(o){
						d.moved=true;
						d.x=o.event.touches[0].pageX;
						d.y=o.event.touches[0].pageY;
						d.target=o.event.touches[0].target;
						f(o,d.x,d.y)
					},
					touchend:function(o){
						k(o,d.x,d.y)
					},
					keydown:function(o){
						if(!c.isEventsEnabled()){
							return
						}
						if(o.shift){
							h.shift=true
						}
						if(o.control){
							h.control=true
						}
						if(o.alt){
							h.alt=true
						}
						if(h.keys[o.code]===false&&o.target.nodeName.toLowerCase()!=="input"){
							if(c.keyboard[o.code].on.contains("keydown")==false){
								return
							}
							h.count++;
							h.keys[o.code]=true;
							o.stop();
							if(!h.fnTimer){
								h.fn=(function(){
									$each(h.keys,function(t,r){
										if(t){
											if(!c.keyboard[r]){
												return
											}
											var v=c.keyboard[r].fn;
											if(v===false||!c[v]){
												return
											}
											var s="";
											if(v.substring(0,4)=="move"){
												s="normal";
												var q=c.keyboard.speed.slow;
												var u=c.keyboard.speed.fast;
												if(h[q]&&!h[u]){
													s="slow"
												}else{
													if(!h[q]&&h[u]){
														s="fast"
													}
												}
											}else{
												if(v.substring(0,4)=="zoom"){
													s=null
												}
											}
											c[v](s)
										}
									})
								});
								if(c.keyboard[o.code].periodical==0){
									h.fn()
								}else{
									if(c.keyboard[o.code].periodical>0){
										h.fnTimer=h.fn.periodical(c.keyboard[o.code].periodical)
									}
								}
							}
						}
					},
					keyup:function(o){
						if(!c.isEventsEnabled()){
							return
						}
						if(!o.shift){
							h.shift=false
						}
						if(!o.control){
							h.control=false
						}
						if(!o.alt){
							h.alt=false
						}
						if(h.keys[o.code]){
							if(c.keyboard[o.code].on.contains("keyup")==false){return}
							h.count--;
							h.keys[o.code]=false;
							o.stop();
							if(h.count==0&&h.fnTimer){
								$clear(h.fnTimer);
								h.fnTimer=null
							}
						}
					}
				}
			)};
			return new Class({
				Extends:Travian.Game.Map.Base,
				blocks:null,
				classType:"Travian.Game.Map.Container",
				containerRender:null,
				containerSize:null,
				containerViewSize:null,
				currentMousePosition:{
					browserAbsolute:{
						x:null,
						y:null
					},
					browser:{
						x:null,
						y:null
					},
					map:{
						x:null,
						y:null
					}
				},
				element:null,
				elementSize:null,
				eventsEnabled:true,
				gridDisplayed:true,
				loading:false,
				forcedUpdates:0,
				addSymbol:function(b){
					var c=this.blocks.find(function(d){
						return d.isMapPositionInRect(b.position)
					});
					if(c){
						c.addSymbol(b)
					}
					return this
				},
				deleteSymbol:function(b){
					var c=this.blocks.find(function(d){
						return d.isMapPositionInRect(b.position)
					});
					if(c){
						c.deleteSymbol(b)
					}
					return this
				},
				disableEvents:function(){
					this.eventsEnabled=false;
					return this
				},
				enableEvents:function(){
					this.eventsEnabled=true;
					return this
				},
				forceUpdateBlocksLayer:function(b){
					this.forcedUpdates=this.forcedUpdates+1;
					this.blocks.each(function(c){
						c.forceUpdateLayer(b)
					});
					return this
				},
				forceUpdateBlocksSymbols:function(c,b){
					this.blocks.each(function(d){
						d.forceUpdateSymbols(c,b)
					});
					return this
				},
				getContentForTooltip:function(b){
					var c=this.blocks.find(function(d){
						return d.isPositionInRect(b)
					});
					return c?c.getContentForTooltip(b):false
				},
				hideGrid:function(){
					this.cookie.set("grid",false);
					this.gridDisplayed=false;
					return this.updateGrid()
				},
				initialize:function(b){
					var d=this;
					var c=null;
					this.loading=true;
					if(!b){
						b=Travian.Game.Map.Options.Default
					}
					this.parent(b);
					this.onMove=this.onMove||Travian.emptyFunction;
					this.onCreate=this.onCreate||Travian.emptyFunction;
					this.onRender=this.onRender||Travian.emptyFunction;
					this.onZoom=this.onZoom||Travian.emptyFunction;
					Travian.Game.Map.register(this);
					this.cookie=new Hash.Cookie(this.id);
					this.containerRender=this.container=$(this.container);
					this.containerRender._map=this;
					this.layers=$A(this.layers);
					var f=$extend(this.containerRender.getDimensions({computeSize:true}),this.containerRender.getPosition());
					if(!this.containerViewSize){
						this.containerViewSize={}
					}
					if(typeof this.containerViewSize.x=="undefined"){
						this.containerViewSize.x=f.x
					}
					if(typeof this.containerViewSize.y=="undefined"){
						this.containerViewSize.y=f.y
					}
					if(typeof this.containerViewSize.width=="undefined"){
						this.containerViewSize.width=f.width
					}
					if(typeof this.containerViewSize.height=="undefined"){
						this.containerViewSize.height=f.height
					}
					this.containerViewSize.right=this.containerViewSize.x+this.containerViewSize.width;
					this.containerViewSize.bottom=this.containerViewSize.y+this.containerViewSize.height;
					this.containerSize={
						x:this.containerViewSize.x,
						y:this.containerViewSize.y,
						width:Math.ceil(this.containerViewSize.width/this.blockSize.width)*this.blockSize.width,height:Math.ceil(this.containerViewSize.height/this.blockSize.height)*this.blockSize.height,right:this.containerViewSize.x+Math.ceil(this.containerViewSize.width/this.blockSize.width)*this.blockSize.width,bottom:this.containerViewSize.y+Math.ceil(this.containerViewSize.height/this.blockSize.height)*this.blockSize.height};
						this.globalProperties.each(function(g){
							if(Travian.Game.Map[g.capitalize()]){
								d[g]=new Travian.Game.Map[g.capitalize()](d[g]||{},d)
							}
						});
						if(this.data.elements){
							this.dataStore.setMultiple(Travian.Game.Map.DataStore.TYPE_TILE,this.data.elements)
						}
						var c=this.cookie.get("grid");
						if(c!==null){
							this.gridDisplayed=c
						}
						this.onCreate(this);
						this.render()
					},
					invalidateBlockVersionCache:function(){
						$each(this.blocks,function(b){
							b.invalidateVersionCache()
						});
						return this
					},
					isEventsEnabled:function(){
						return this.eventsEnabled
					},
					move:function(b){
						this.transition.move(b);
						if(this.blocks!=null){
							$each(this.blocks,function(c){
								c.move(b)
							})
						}
						if(this.loading){
							if(!this.blockInitialDelta){
								this.blockInitialDelta={
									x:0,
									y:0
								}
							}
							this.blockInitialDelta.x+=b.x;
							this.blockInitialDelta.y+=b.y
						}
						this.onMove(this,b);
						return this
					},
					moveDown:function(b){
						if(typeof b=="string"){
							b=this.speeds[b]
						}
						if(!b){
							return
						}
						return this.move({
							x:0,
							y:b
						})
					},
					moveLeft:function(b){
						if(typeof b=="string"){
							b=this.speeds[b]
						}
						if(!b){
							return
						}
						return this.move({
							x:b,
							y:0
						})
					},
					moveLeftDown:function(b){
						if(typeof b=="string"){
							b=this.speeds[b]
						}
						if(!b){
							return
						}
						return this.move({
							x:b,
							y:b
						})
					},
					moveLeftUp:function(b){
						if(typeof b=="string"){
							b=this.speeds[b]
						}
						if(!b){
							return
						}
						return this.move({
							x:b,
							y:-b
						})
					},
					moveRight:function(b){
						if(typeof b=="string"){
							b=this.speeds[b]
						}
						if(!b){
							return
						}
						return this.move({
							x:-b,
							y:0
						})
					},
					moveRightDown:function(b){
						if(typeof b=="string"){
							b=this.speeds[b]
						}
						if(!b){
							return
						}
						return this.move({
							x:-b,
							y:b
						})
					},
					moveRightUp:function(b){
						if(typeof b=="string"){
							b=this.speeds[b]
						}
						if(!b){
							return
						}
						return this.move({
							x:-b,
							y:-b
						})
					},
					moveTo:function(c){
						var b=this.transition.translateToBrowser({
							x:Math.floor(c.x),
							y:Math.floor(c.y)
						});
						b.x+=this.blockSize.width/this.transition.elementsPerBlock.x/2;
						b.y+=this.blockSize.height/this.transition.elementsPerBlock.y/2;
						b.x+=(this.containerSize.width-this.containerViewSize.width)/2;b.y+=(this.containerSize.height-this.containerViewSize.height)/2;
						return this.move({
							x:this.elementSize.width/2-b.x,y:-(this.elementSize.height/2-b.y)
						})
					},
					moveUp:function(b){
						if(typeof b=="string"){
							b=this.speeds[b]
						}
						if(!b){
							return
						}
						return this.move({
							x:0,
							y:-b
						})
					},
					render:function(){
						this.container=new Element("div",{
							styles:{
								overflow:"hidden",
								position:"relative",
								left:0,
								top:0,
								width:"100%",
								height:"100%",
								right:0,
								bottom:0
							}
						}).disableSelection().inject(this.containerRender,"top").set("oncontextmenu","return (false);");
						this.elementSize={
							x:-this.blockSize.width*this.blockOverflow,
							y:-this.blockSize.height*this.blockOverflow,
							width:this.containerSize.width+this.blockSize.width*this.blockOverflow*2,
							height:this.containerSize.height+this.blockSize.height*this.blockOverflow*2
						};
						this.parent({
							nodeType:"div"
						}).element.setStyles({
							position:"absolute",
							left:this.elementSize.x,
							top:this.elementSize.y,
							width:this.elementSize.width,
							height:this.elementSize.height
						}).inject(this.container,"top");
						this.containerMover=new Element("div",{
							styles:{
								overflow:"hidden",
								position:"absolute",
								left:0,
								top:0,
								width:this.containerViewSize.width,
								height:this.containerViewSize.height,
								zIndex:100,
								backgroundColor:Browser.Engine.trident?"#FFFFFF":"transparent",
								opacity:Browser.Engine.trident?0.001:1
							}
						}).disableSelection().inject(this.container,"after");
						this.onRender(this);
						this.moveTo(this.mapInitialPosition);
						this.renderBlocks();
						if(this.gridDisplayed){
							this.showGrid()
						}
						a(this);
						this.loading=false;
						return this
					},
					renderBlocks:function(){
						if(this.blocks){
							return this
						}
						this.blocks=$A([]);
						var c=Math.ceil(this.elementSize.width/this.blockSize.width);
						var b=Math.ceil(this.elementSize.height/this.blockSize.height);
						var f={
							x:0,
							y:0
						};
						var h=null;
						var l=null;
						var d=null;
						if(this.blockInitialDelta){
							f=$clone(this.blockInitialDelta);
							delete (this.blockInitialDelta)
						}
						for(var j=0,g=0;j<b;j++){
							for(var k=0;k<c;k++){
								h=Travian.Game.Map.Layer.Block.getCorrect
							}
						}
						return this
					},
					showGrid:function(){
						this.cookie.set("grid",true);
						this.gridDisplayed=true;
						return this.updateGrid()
					},
					toggleGrid:function(){
						var b="showGrid";
						if(this.gridDisplayed===true){
							b="hideGrid"
						}
						return this[b]()
					},
					toggleMiniMap:function(){
						return this.miniMap.animate()
					},
					toggleOutline:function(){
						return this.outline.animate()
					},
					updateGrid:function(){
						var c=this;
						var b=c.gridDisplayed?this.grid[this.transition.zoomLevel]:false;
						this.element.select(".imageMark").each(function(d){
							d.setStyles({
								backgroundColor:"transparent",
								backgroundImage:b!=false?"url("+b+")":"none",
								backgroundPosition:"left top",
								backgroundRepeat:"repeat"
							})
						});
						return this
					},
					updateSymbolData:function(b){
						var c=this.blocks.find(function(d){
							return d.isMapPositionInRect(b.position)
						});
						if(c){
							c.updateSymbolData(b)
						}
						return this
					},
					zoom:function(c,b){
						if(this.transition.zoom(c)){
							this.onZoom(this);
							this.moveTo(b);
							if(this.gridDisplayed){
								this.updateGrid()
							}
						}
						return this
					},
					zoomIn:function(b){
						if(!b){
							b=this.transition.getPointOfCenterInView()
						}
						return this.zoom(-1,b)
						Position({
							x:k*this.blockSize.width+f.x,
							y:j*this.blockSize.height-f.y,
							width:this.blockSize.width,
							height:this.blockSize.height
						},this).position;
						l=this.transition.translateToMap(h);
						d={
							id:g++,
							version:0
						};
						if(this.data.blocks[l.x]&&this.data.blocks[l.x][l.y]&&this.data.blocks[l.x][l.y][l.right]&&this.data.blocks[l.x][l.y][l.right][l.bottom]){
							d=$merge(d,this.data.blocks[l.x][l.y][l.right][l.bottom])
						}
						this.blocks.push(new Travian.Game.Map.Layer.Block($merge(this.options.block,{
							id:d.id,
							symbolTypes:this.symbolTypes,
							position:h,
							mapCoordinates:l,
							version:d.version
						}),this))
					},
					zoomOut:function(b){
						if(!b){
							b=this.transition.getPointOfCenterInView()
						}
						return this.zoom(1,b)
					}
				})
		})();
		Travian.Game.Map.Transition=(function(){
			var a=$A([]);
			var d=function(h,g){
				var f=false;
				do{
					f=false;
					if(Math.round(h.x)>g.border.right){
						h.x=g.border.left+(h.x-g.border.right)-1;
						f=true
					}else{
						if(Math.round(h.x)<g.border.left){
							h.x=g.border.right-(g.border.left-h.x)+1;
							f=true
						}
					}
					if(Math.round(h.right)>g.border.right){
						h.right=g.border.left+(h.right-g.border.right)-1;
						f=true
					}else{
						if(Math.round(h.right)<g.border.left){
							h.right=g.border.right-(g.border.left-h.right)+1;
							f=true
						}
					}
					if(Math.round(h.y)>g.border.bottom){
						h.y=g.border.top+(h.y-g.border.bottom)-1;
						f=true
					}else{
						if(Math.round(h.y)<g.border.top){
							h.y=g.border.bottom-(g.border.top-h.y)+1;
							f=true
						}
					}
					if(Math.round(h.bottom)>g.border.bottom){
						h.bottom=g.border.top+(h.bottom-g.border.bottom)-1;
						f=true
					}else{
						if(Math.round(h.bottom)<g.border.top){
							h.bottom=g.border.bottom-(g.border.top-h.bottom)+1;
							f=true
						}
					}
				}
				while(f);
				return h
			};
			var b=function(f){
				f.elementsPerBlock=f.zoomOptions.sizes[f.zoomLevel-1];
				f.pixelPerTile={
					x:f.mapContainer.blockSize.width/f.elementsPerBlock.x,
					y:f.mapContainer.blockSize.height/f.elementsPerBlock.y};
					f.elementsInView={
						x:f.elementsPerBlock.x*f.mapContainer.containerSize.width/f.mapContainer.blockSize.width,
						y:f.elementsPerBlock.y*f.mapContainer.containerSize.height/f.mapContainer.blockSize.height
					}
				};
				var c=function(j,g){
					var h={
						x:j.mapContainer.containerSize.x+j.mapContainer.elementSize.x,
						y:j.mapContainer.containerSize.y+j.mapContainer.elementSize.y
					};
					var f=j.mapContainer.blockSize.height/j.elementsPerBlock.y;
					return{
						x:(g.x-j.positionOrigin.map.x)*j.pixelPerTile.x+j.positionOrigin.browser.x-h.x,
						y:(j.positionOrigin.map.y-g.y)*j.pixelPerTile.y-f-h.y+j.positionOrigin.browser.y
					}
				};
				return new Class({
					Extends:Travian.Game.Map.Base,
					classType:"Travian.Game.Map.Transition",
					elementsPerBlock:null,
					pixelPerTile:null,
					zoomLevel:null,
					correctCoordinates:function(f){
						return d(f,this)
					},
					getPointOfCenterInView:function(){
						var f={
							x:this.mapContainer.containerViewSize.x+this.mapContainer.containerViewSize.width/2,
							y:this.mapContainer.containerViewSize.y+this.mapContainer.containerViewSize.height/2
						};
						f.x-=this.mapContainer.containerSize.x;
						f.y-=this.mapContainer.containerSize.y;
						f.x-=this.mapContainer.elementSize.x;
						f.y-=this.mapContainer.elementSize.y;
						return this.translateToMap(f)
					},
					initialize:function(f,h){
						var g=this;
						this.parent(f,h);
						this.onMove=this.onMove||Travian.emptyFunction;
						this.onCreate=this.onCreate||Travian.emptyFunction;
						this.onZoom=this.onZoom||Travian.emptyFunction;
						this.border.width=this.border.right-this.border.left+1;
						this.border.height=this.border.bottom-this.border.top+1;
						this.zoomLevel=this.zoomOptions.level;
						this.zoomOptions.sizes.each(function(k,j){
							if(typeof k=="number"){
								g.zoomOptions.sizes[j]={
									x:Math.floor(g.zoomOptions.sizes[j]*g.mapContainer.blockSize.width/g.mapContainer.containerSize.width),
									y:Math.floor(g.zoomOptions.sizes[j]*g.mapContainer.blockSize.height/g.mapContainer.containerSize.height)
								}
							}
						});
						this.positionOrigin={
							browser:{
								x:this.mapContainer.containerSize.x,
								y:this.mapContainer.containerSize.y+this.mapContainer.containerSize.height
							},
							map:{
								x:0,
								y:0
							}
						};
						b(this);
						this.onCreate(this)
					},
					move:function(f){
						this.positionOrigin.browser.x+=f.x;
						this.positionOrigin.browser.y-=f.y;
						this.onMove(this,f);
						return this
					},
					registerCallbackOnZoom:function(f){
						a.push(f);
						return this
					},
					translateToBrowser:function(g){
						var h={
							x:this.mapContainer.containerSize.x+this.mapContainer.elementSize.x,
							y:this.mapContainer.containerSize.y+this.mapContainer.elementSize.y
						};
						var f=this.mapContainer.blockSize.height/this.elementsPerBlock.y;
						return{
							x:(g.x-this.positionOrigin.map.x)*this.pixelPerTile.x+this.positionOrigin.browser.x-h.x,
							y:(this.positionOrigin.map.y-g.y)*this.pixelPerTile.y-f-h.y+this.positionOrigin.browser.y
						}
					},
					translateToMap:function(h,j){
						j=$merge({round:true,correct:true},j||{});
						var k={
							x:this.mapContainer.containerSize.x+this.mapContainer.elementSize.x,
							y:this.mapContainer.containerSize.y+this.mapContainer.elementSize.y
						};
						var g=this.mapContainer.blockSize.height/this.elementsPerBlock.y;
						if(typeof h.height!="undefined"){
							g=h.height
						}
						var f=null;
						if(j.round){
							f={
								x:Math.floor((h.x+k.x-this.positionOrigin.browser.x)/this.pixelPerTile.x)+this.positionOrigin.map.x,
								y:this.positionOrigin.map.y-Math.floor((h.y+g+(k.y-this.positionOrigin.browser.y))/this.pixelPerTile.y)
							}
						}else{
							f={
								x:((h.x+k.x-this.positionOrigin.browser.x)/this.pixelPerTile.x)+this.positionOrigin.map.x-1,
								y:this.positionOrigin.map.y-((h.y+g+(k.y-this.positionOrigin.browser.y))/this.pixelPerTile.y)
							}
						}
						if(h.width){
							f.right=f.x+h.width/this.pixelPerTile.x-1
						}
						if(h.height){
							f.bottom=f.y+h.height/this.pixelPerTile.y-1
						}
						if(j.correct){
							f=d(f,this)
						}
						return f
					},
					zoom:function(g){
						var f=this;
						if(g==0||(g<0&&this.zoomLevel+g<1)||(g>0&&this.zoomLevel+g>this.zoomOptions.sizes.length)){
							return false
						}
						this.zoomLevel+=g;
						b(this);
						this.onZoom(this);
						a.each(function(h){h(f)});
						return true
					}
				})
			})();
		Travian.Game.Map.Transition.Precision=2;
		Travian.Game.Map.Updater=(function(){
			var c=window.location.href.split("/").slice(0,-1).join("/")+"/";
			var b=function(h){
				if(h.objects.ajax.getLength()<=0){
					return false
				}
				h.updateWorking(+1);
				var g=$A([]);
				h.objects.ajax.each(function(k){
					var j=k.getRequestData();
					if(j!==false){
						g.push(j)
					}
				});
				h.requestObject.multiple=Travian.ajax({
					url:h.url,
					data:$merge(h.parameters.multiple,{
						data:g,
						zoomLevel:h.transition.zoomLevel
					}),
					onSuccess:function(j){
						h.updateWorking(-1);
						h.setContentDataAndRefresh(j);
						d(h)
					},
					onFailure:function(j){
						h.updateWorking(-1);
						h.setContentDataAndRefresh(j);
						d(h)
					}
				});
				return true
			};
			var a=function(j,h){
				j.updateWorking(+1);
				var g={
					x0:h.position.x+j.options.positionOptions.areaAroundPosition[j.transition.zoomLevel].left,
					y0:h.position.y+j.options.positionOptions.areaAroundPosition[j.transition.zoomLevel].top,
					x1:h.position.x+j.options.positionOptions.areaAroundPosition[j.transition.zoomLevel].right,
					y1:h.position.y+j.options.positionOptions.areaAroundPosition[j.transition.zoomLevel].bottom
				};
				if(j.requestObject.position){
					j.requestObject.position.cancel();
					j.requestObject.position=null;
					j.updateWorking(-1)
				}
				j.requestObject.position=Travian.ajax({
					url:j.url,
					data:$merge(j.parameters.position,{
						data:$merge(h.position,{
							zoomLevel:j.transition.zoomLevel,
							ignorePositions:j.dataStore.getPositionsOfData(h.dataStoreType).inject([],function(l,k){
								if(Travian.Game.Map.isMapPositionInRect(g,k)){
									l.push(Travian.Game.Map.xy2id(k.x,k.y))
								}
								return l
							})
						})
					}),
					onSuccess:function(k){
						j.updateWorking(-1);
						(h.onSuccess||Travian.emptyFunction)(k)
					},
					onFailure:function(k){
						j.updateWorking(-1);
						(h.onFailure||Travian.emptyFunction)(k)
					}
				})
			};
			var f=function(h,g){
				g.element.src=g.srcUrl;
				if(g.finishedLoading){
					g.finishedLoading()
				}
				delete (h.loadings[g.blockContainer.updaterId][g.updaterId]);
				if(h.loadings[g.blockContainer.updaterId].getLength()==0){
					g.blockContainer.layers.loading.hide()
				}
				h.requestCountImages--;
				h.updateWorking(-1);
				d(h)
			};
			var d=function(g){
				if(g.requestCountImages>=g.maxRequestCount){return}
				if(g.objects.images.getLength()==0){return}
				g.objects.images.sort(function(l,k){
					var j=l.getPriority();
					var h=k.getPriority();
					if(j<h){
						return -1
					}else{
						if(j>h){
							return 1
						}
					}
					return 0
				}).some(function(k,j){
					var h=f.pass([g,k]);
					delete (g.objects.images[k.updaterId]);
					g.requestCountImages++;
					g.updateWorking(+1);
					if(k.element.src.replace(c,"")==k.srcUrl){
						h.delay(1)
					}else{
						if(!k.imageLoader){
							k.imageLoader=$(new Image()).addEvent("load",h)
						}
						k.refreshSrcUrl();
						k.imageLoader.src=k.srcUrl
					}
					return g.requestCountImages>=g.maxRequestCount})
				};
				return new Class({
					Extends:Travian.Game.Map.Base,
					lastRequestPosition:{
						x:null,
						y:null
					},
					loadings:{},
					requestCount:0,
					requestCountImages:0,
					requestDelayId:{
						multiple:null,
						position:null
					},
					requestImages:$H({}),
					requestObject:{
						multiple:null,
						position:null
					},
					objects:null,
					classType:"Travian.Game.Map.Updater",
					initialize:function(g,h){
						this.parent(g,h);
						this.objects={
							ajax:$H({}),
							images:$H({})
						};
						this.elementWorking=$(this.elementWorking)
					},
					register:function(h,g){
						var j=this;
						if(!this.objects[h]){
							return this
						}
						if(!g.updaterId){
							g.updaterId=Travian.Game.Map.getNewId()
						}
						if(!this.objects[h][g.updaterId]){
							this.objects[h][g.updaterId]=g
						}
						if(h=="images"){
							if(!g.blockContainer.updaterId){
								g.blockContainer.updaterId=Travian.Game.Map.getNewId()
							}
							if(!this.loadings[g.blockContainer.updaterId]){
								this.loadings[g.blockContainer.updaterId]=$H({})
							}
							this.loadings[g.blockContainer.updaterId][g.updaterId]=true;
							g.blockContainer.layers.loading.show()
						}
						this.request();
						return this
					},
					request:function(){
						var g=this;
						if(this.requestObject.multiple&&this.requestObject.multiple.cancel){
							this.requestObject.multiple.cancel();
							this.requestObject.multiple=null;
							this.updateWorking(-1)
						}
						if(this.requestDelayId.multiple){
							$clear(this.requestDelayId.multiple);
							this.requestDelayId.multiple=null
						}
						this.requestDelayId.multiple=(function(){
							if(b(g)===false){
								d(g)
							}
						}).delay(this.requestDelayTime.multiple);
						return this
					},
					requestPosition:function(g){
						var h=this;
						if(this.lastRequestPosition.x==g.position.x&&this.lastRequestPosition.y==g.position.y){
							return this
						}
						this.lastRequestPosition.x=g.position.x;
						this.lastRequestPosition.y=g.position.y;
						if(this.requestObject.position&&this.requestObject.position.cancel){
							this.requestObject.position.cancel();
							this.requestObject.position=null;
							this.updateWorking(-1)
						}
						if(this.requestDelayId.position){
							$clear(this.requestDelayId.position);
							this.requestDelayId.position=null
						}
						this.requestDelayId.position=(function(){a(h,g)}).delay(this.requestDelayTime.position);
						return this
					},
					setContentDataAndRefresh:function(g){
						var h=this;
						if(g.blocks){
							$each(g.blocks,function(k,j){
								$each(k,function(l,m){
									$each(l,function(o,n){
										$each(o,function(t,r){
											var q={
												x:j,
												y:m,
												right:n,
												bottom:r
											};
											var s=$merge(h.dataStore.get(Travian.Game.Map.DataStore.TYPE_BLOCKS,q,"block")||{},t);
											h.dataStore.push({
												type:Travian.Game.Map.DataStore.TYPE_BLOCKS,
												position:q,
												index:"block",
												data:s
											})
										})
									})
								})
							});
							this.mapContainer.invalidateBlockVersionCache()
						}
						if(g.elements){
							this.dataStore.setMultiple(Travian.Game.Map.DataStore.TYPE_TILE,g.elements)
						}
						this.objects.ajax.each(function(j){
							if(j.refreshContent){
								j.refreshContent()
							}
							delete (h.objects.ajax[j.updaterId])
						});
						return this
					},
					updateWorking:function(g){
						this.requestCount+=g;
						if(this.requestCount<0){this.requestCount=0}
						if(this.elementWorking){
							if(this.requestCount>0){
								this.elementWorking.setStyles({visibility:"visible"})
							}else{
								this.elementWorking.setStyles({visibility:"hidden"})
							}
							this.elementWorking.set("html",this.requestCount)
						}
						return this
					}
				})
			})();
			Travian.Game.Map.ContextMenu=new Class({
				Implements:[Options,Events],
				options:{
					actions:{},
					menu:"contextmenu",
					stopEvent:true,
					targets:"body",
					trigger:"contextmenu",
					offsets:{
						x:0,
						y:0
					},
					onShow:$empty,
					onHide:$empty,
					onClick:$empty,
					fadeSpeed:200
				},
				classType:"Travian.Game.Map.ContextMenu",
				parentContainer:null,
				mapPosition:null,
				addAction:function(b){
					var d=this;
					var c=false;
					b.element=$(b.element);
					if(Browser.Engine.trident&&Browser.Engine.version==4){
						c=b.element.hasClass("hideIE6")
					}
					if(b.element&&!c){
						var a=b.element.down("a");
						if(a){
							a.addEvent("click",function(f){
								b.fn(d,d.mapPosition,d.contentData)
							});
							this.actions.push(b)
						}else{
							b.element.hide()
						}
					}
					return this
				},
				disable:function(){
					this.options.disabled=true;
					return this
				},
				disableItem:function(a){
					this.menu.getElements("a[href$="+a+"]").addClass("disabled");
					return this
				},
				enable:function(){
					this.options.disabled=false;
					return this
				},
				enableItem:function(a){
					this.menu.getElements("a[href$="+a+"]").removeClass("disabled");
					return this
				},
				execute:function(b,a){
					if(this.options.actions[b]){
						this.options.actions[b](a,this)
					}
					return this
				},
				hide:function(){
					if(this.shown){
						this.fx.start(0);
						this.parentContainer.enableEvents();
						this.fireEvent("hide");
						this.shown=false
					}
					return this
				},
				initialize:function(a,c){
					var b=this;
					this.setOptions(a);
					this.parentContainer=c;
					this.menu=document.id(this.options.menu);
					this.targets=$$(this.options.targets);
					this.fx=new Fx.Tween(this.menu,{
						property:"opacity",
						duration:this.options.fadeSpeed
					});
					this.hide().startListener();
					this.menu.setStyles({
						position:"absolute",
						top:"-900000px",
						display:"block"
					});
					$(a.menu).dispose().inject(document.body);
					this.actions=[];
					a.actions.each(function(d){
						b.addAction(d)
					});
					this.targets.each(function(d){
						d.addEvent(b.options.trigger,function(f){
							b.mapPosition=b.parentContainer.transition.translateToMap({
								x:f.page.x-b.parentContainer.containerSize.x-b.parentContainer.elementSize.x,
								y:f.page.y-b.parentContainer.containerSize.y-b.parentContainer.elementSize.y
							});
							b.update()
						})
					})
				},
				show:function(){
					this.fx.start(1);
					this.parentContainer.disableEvents();
					this.fireEvent("show");
					this.shown=true;
					return this
				},
				startListener:function(){
					var a=this;
					this.targets.each(function(b){
						b.addEvent(a.options.trigger,function(c){
							if(c.target==a.parentContainer.containerMover&&!a.options.disabled){
								if(a.options.stopEvent){
									c.stop()
								}
								a.options.element=document.id(b);
								a.menu.setStyles({
									top:(c.page.y+a.options.offsets.y),
									left:(c.page.x+a.options.offsets.x),
									position:"absolute"
								});
								a.show()
							}
						})
					});
					this.menu.getElements("a").each(function(b){
						b.addEvent("click",function(c){
							if(!b.hasClass("disabled")){
								a.execute(b.get("href").split("#")[1],document.id(a.options.element));
								a.fireEvent("click",[b,c])
							}
						})
					});
					document.id(document.body).addEvent("click",function(){a.hide()});
					return this
				},
				update:function(){
					var a=this;
					if(this.options.disabled||!this.shown){return this}
					this.contentData=this.parentContainer.dataStore.get(Travian.Game.Map.DataStore.TYPE_TOOLTIP,this.mapPosition);
					this.actions.each(function(b){
						if(b.displayOn===true||(a.contentData!=null&&a.contentData[b.displayOn])){
							b.element.show()
						}else{
							b.element.hide()
						}
					});
					$each(this.options.separators,function(d){
						var c=a.menu.down(d.selector);
						if(!c){
							return
						}
						var b=0;
						$A(d.elements).each(function(f){
							var g=a.menu.down(f);
							if(!g){return}
							if(g.isDisplayed()){b++}
							return
						});
						c[b>0?"show":"hide"]().getPrevious()[b>0?"show":"hide"]()
					});
					return this
				}
			});
			Travian.Game.Map.DataStore=(function(){
				var g=0;
				var f=function(h){
					$each(h.options.useStorageForType,function(k,j){
						if(k){
							Travian.Storage.set("mapDataContainer."+j,h.data[j],h.options.persistentStorage)
						}
					})
				};
				var c=function(k,n,h){
					var l=h.x;
					var o=h.y;
					var j=typeof h.right!="undefined"?h.right:l;
					var m=typeof h.bottom!="undefined"?h.bottom:o;
					if(!k.data[n]){
						k.data[n]={
							all:$H()
						}
					}
					if(!k.data[n][l]){
						k.data[n][l]={}
					}
					if(!k.data[n][l][o]){
						k.data[n][l][o]={}
					}
					if(!k.data[n][l][o][j]){
						k.data[n][l][o][j]={}
					}
					if(!k.data[n][l][o][j][m]){
						k.data[n][l][o][j][m]={}
					}
					if(!k.data[n][l][o][j][m].id){
						g++;
						k.data[n][l][o][j][m].id=g
					}
					k.data[n][l][o][j][m].position=h;
					return k.data[n][l][o][j][m]
				};
				var b=function(k,n,h){
					var l=h.x;
					var o=h.y
					var j=typeof h.right!="undefined"?h.right:l;
					var m=typeof h.bottom!="undefined"?h.bottom:o;
					if(!k.data[n]){
						return null
					}
					if(!k.data[n][l]){
						return null
					}
					if(!k.data[n][l][o]){
						return null
					}
					if(!k.data[n][l][o][j]){
						return null
					}
					if(!k.data[n][l][o][j][m]){
						return null
					}
					if(d(k,k.data[n][l][o][j][m],n)){
						return null
					}
					return k.data[n][l][o][j][m]
				};
				var d=function(h,k,j){
					return k.time!==false&&(new Date()).getTime()-k.time>h.cachingTimeForType[j]
				};
				var a=new Class({
					Extends:Travian.Game.Map.Base,
					classType:"Travian.Game.Map.DataStore",
					data:null,
					get:function(k,h,j){
						var l=b(this,k,h);
						if(l==null){
							return null
						}
						if(typeof j!="undefined"){
							if(l.data[j]){
								return l.data[j]
							}
							return null
						}
						return l.data
					},
					getDataForArea:function(l,j,o){
						var m=this;
						var h=[];
						var n=null;
						var k=$clone(j);
						if(!this.data[l]||!this.data[l].all){
							return h
						}
						if(k.x>k.right){
							k.right+=this.parentContainer.transition.border.width
						}
						if(k.y>k.bottom){
							k.bottom+=this.parentContainer.transition.border.height
						}
						this.data[l].all.each(function(q){
							var r={
								x:q.position.x,
								y:q.position.y
							};
							if(k.x>r.x){
								r.x+=m.parentContainer.transition.border.width
							}
							if(k.y>r.y){
								r.y+=m.parentContainer.transition.border.height
							}
							if(d(m,q,l)===false&&k.x<=r.x&&r.x<=k.right&&k.y<=r.y&&r.y<=k.bottom){
								if(o){
									$each(q.data,function(s){
										h.push(s)
									})
								}else{
									h.push(q.data)
								}
							}
						});
						return h
					},
					getPositionsOfData:function(h){
						var j=this;
						if(!this.data[h]||!this.data[h].all){
							return[]
						}
						return this.data[h].all.inject([],function(l,k){
							if(d(j,k,h)===false){
								l.push(k.position)
							}
							return l
						})
					},
					initialize:function(h,k){
						var j=this;
						this.parent(h,k);
						this.data={};
						$each(this.options.clearStorageForType,function(m,l){
							if(m){
								Travian.Storage.clear("mapDataContainer."+l,j.options.persistentStorage)
							}
						});
						this.options.useStorageForType=$H(this.options.useStorageForType).inject($H(),function(n,o,l){
							if(o){
								n[l]=true;
								j.data[l]=Travian.Storage.get("mapDataContainer."+l,j.options.persistentStorage)||{};
								if(!j.data[l].all){
									j.data[l].all=$H({})
								}else{
									j.data[l].all=$H(j.data[l].all);
									var m=j.data[l].all.getKeys().max();
									if(m>g){g=m}
								}
							}
							return n
						})
					},
					push:function(h){
						if(typeof h.time=="undefined"){
							h.time=(new Date()).getTime()
						}
						if(h.time==-1){
							h.time=false
						}
						h=Travian.Game.Map.remapShortParameters(h);
						var j=c(this,h.type,h.position);
						if(!j.data){
							j.data={}
						}
						j.data[h.index]=h.data;
						j.time=h.time;
						this.data[h.type].all[j.id]=j;
						return this
					},
					refresh:function(h){
						var j=b(this,h.type,h.position);
						if(j!=null){
							if(typeof h.time=="undefined"){
								h.time=(new Date()).getTime()
							}
							if(h.time==-1){
								h.time=false
							}
							j.time=h.time
						}
						return this
					},
					remove:function(k,h,j){
						var l=b(this,k,h);
						if(l==null){
							return this
						}
						if(typeof j!="undefined"){
							if(l.data[j]){
								delete (l.data[j])
							}
							return this
						}
						l.time=0;
						return this
					},
					saveDataToStorage:function(){
						f(this);
						return this
					},
					set:function(h){
						var j=this;
						if(typeof h.time=="undefined"){
							h.time=(new Date()).getTime()
						}
						if(h.time==-1){
							h.time=false
						}
						h=Travian.Game.Map.remapShortParameters(h);
						var k=c(this,h.type,h.position);
						k.data=h.data;
						k.time=h.time;
						this.data[h.type].all[k.id]=k;
						if(h.data.symbols){
							h.data.symbols.each(function(m,l){
								if(!m.dataId){
									m.dataId=m.type+"-"+l
								}
								m=Travian.Game.Map.remapShortParameters(m);
								if(!m.position){
									m.position=h.position
								}
								j.push({
									type:Travian.Game.Map.DataStore.TYPE_SYMBOL,
									position:h.position,
									data:m,
									index:m.dataId,
									time:false
								})
							})
						}
						return this
					},
					setMultiple:function(j,h,l){
						var k=this;
						$A(h).each(function(m){
							m=Travian.Game.Map.remapShortParameters(m);
							k.set({
								type:j,
								position:m.position,
								data:m,
								time:l
							})
						});
						f(this);
						return this
					}
				});
				a.TYPE_BLOCKS="blocks";
				a.TYPE_SYMBOL="symbol";
				a.TYPE_TILE="tile";
				a.TYPE_TOOLTIP="tooltip";
				return a
			})();
			Travian.Game.Map.Tips={
				lastText:"",
				lastTitle:"",
				tooltipHtml:'<span class="xCoord">({x}</span><span class="pi">|</span><span class="yCoord">{y})</span><span class="clear"></span>',
				render:function(c,a){
					var b=this;
					a.setTitle({title:"",text:""}).addEvents({
						mousemove:function(g){
							var f={
								x:g.page.x-c.containerSize.x-c.elementSize.x,
								y:g.page.y-c.containerSize.y-c.elementSize.y
							};
							var d=c.getContentForTooltip(f,g);
							if(d===false){
								d={
									title:"",
									text:b.tooltipHtml.substitute(c.transition.translateToMap(f))
								}
							}
							if(b.lastText!=d.text||b.lastTitle!=d.title){
								d.unescaped=true;
								Travian.Tip.show(d);
								b.lastText=d.text;
								b.lastTitle=d.title
							}
						}
					});
					return this
				}
			};
			Travian.Game.Map.Rulers=(function(){
				var b=function(h,g){
					g+=h.delta.x[h.transition.zoomLevel];
					if(g<h.transition.border.left){
						g=h.transition.border.right-(h.transition.border.left-g)+1
					}else{
						if(g>h.transition.border.right){
							g=h.transition.border.left+(g-h.transition.border.right)-1
						}
					}
					return g
				};
				var a=function(h,g){
					g+=h.delta.y[h.transition.zoomLevel];
					if(g<h.transition.border.top){
						g=h.transition.border.bottom-(h.transition.border.top-g)+1
					}else{
						if(g>h.transition.border.bottom){
							g=h.transition.border.top+(g-h.transition.border.bottom)-1
						}
					}
					return g
				};
				var f=function(g){
					g.elements.moverX.setStyles({
						backgroundImage:"url("+g.imgSource.x.substitute({
							zoomLevel:g.transition.zoomLevel
						})+")"
					});
					g.elements.moverY.setStyles({
						backgroundImage:"url("+g.imgSource.y.substitute({
							zoomLevel:g.transition.zoomLevel
						})+")"
					})
				};
				var d=function(n){
					if(n.elements.coordinates){
						n.elements.coordinates.x.invoke("dispose");
						n.elements.coordinates.y.invoke("dispose")
					}
					n.elements.coordinates={
						x:$A([]),
						y:$A([])
					};
					var o=n.transition.elementsInView.x+n.transition.elementsPerBlock.x*2;
					var m=n.steps.x[n.transition.zoomLevel];
					for(var g=0,h=null,k=null;g<o;g+=m){
						h=(new Element("div",{
							"class":"coordinate zoom"+n.transition.zoomLevel,
							styles:{
								position:"absolute",
								left:g*n.mapContainer.blockSize.width/n.transition.elementsPerBlock.x,top:0,
								width:m*n.mapContainer.blockSize.width/n.transition.elementsPerBlock.x,
								height:n.containerSize.height
							}
						})).inject(n.elements.moverX,"bottom");
						h.rulerLeft=g*n.mapContainer.blockSize.width/n.transition.elementsPerBlock.x;
						k=h.getDimensions({computeSize:true});
						h.setStyles({
							width:k.width-k["padding-left"]-k["padding-right"],
							height:k.height-k["padding-top"]-k["padding-bottom"]
						});
						n.elements.coordinates.x[g]=h
					}
					var l=n.transition.elementsInView.y+n.transition.elementsPerBlock.y*2;
					var j=n.steps.y[n.transition.zoomLevel];
					for(var g=0,h=null,k=null;g<l;g+=j){
						h=(new Element("div",{
							"class":"coordinate zoom"+n.transition.zoomLevel,
							styles:{
								position:"absolute",
								left:0,
								top:g*n.mapContainer.blockSize.height/n.transition.elementsPerBlock.y,
								width:n.containerSize.width,height:j*n.mapContainer.blockSize.height/n.transition.elementsPerBlock.y
							}
						})).inject(n.elements.moverY,"bottom");
						h.rulerTop=g*n.mapContainer.blockSize.height/n.transition.elementsPerBlock.y;
						k=h.getDimensions({computeSize:true});
						if(k.height-k["padding-top"]-k["padding-bottom"]>0){
							h.setStyles({
								width:k.width-k["padding-left"]-k["padding-right"],
								height:k.height-k["padding-top"]-k["padding-bottom"]
							})
						}else{
							h.setStyles({height:0})
						}
						n.elements.coordinates.y[g]=h
					}
					c(n,true,true)
				};
				var c=function(k,h,g){
					var j=false;
					do{
						j=false;
						if(k.position.x<-2*k.mapContainer.blockSize.width){
							k.position.x+=1*k.mapContainer.blockSize.width;
							h=true;
							j=true
						}
						if(k.position.x>0){
							k.position.x+=-1*k.mapContainer.blockSize.width;
							h=true;
							j=true
						}
						if(k.position.y<-2*k.mapContainer.blockSize.height){
							k.position.y+=1*k.mapContainer.blockSize.height;
							g=true;
							j=true
						}
						if(k.position.y>0){
							k.position.y+=-1*k.mapContainer.blockSize.height;
							g=true;
							j=true
						}
					}
					while(j);
					k.elements.moverX.setStyles({left:k.position.x});
					k.elements.moverY.setStyles({top:k.position.y});
					if(h&&k.elements.coordinates){
						k.elements.coordinates.x.each(function(n,l){
							if(n){
								var m=k.transition.translateToMap({
									x:k.position.x+n.rulerLeft-k.mapContainer.elementSize.x,
									y:0
								});
								n.set("html",b(k,m.x))
							}
						})
					}
					if(g&&k.elements.coordinates){
						k.elements.coordinates.y.each(function(m){
							if(m){
								var l=k.transition.translateToMap({
									x:0,
									y:k.position.y+m.rulerTop-k.mapContainer.elementSize.y
								});
								m.set("html",a(k,l.y))
							}
						})
					}
				};
				return new Class({
					Extends:Travian.Game.Map.Base,
					classType:"Travian.Game.Map.Rulers",
					destroy:function(){
						this.elements.containerX.dispose();
						this.elements.containerY.dispose();
						return this
					},
					initialize:function(g,h){
						if(!g.direction){
							g.direction=$(document.body).getStyle("direction")
						}
						this.parent(g,h);
						this.position={x:0,y:0}
					},
					render:function(){
						var g=this;
						this.position={
							x:this.mapContainer.blockSize.width,
							y:this.mapContainer.blockSize.height
						};
						$each(this.mapContainer.blocks,function(h){
							if(g.position.x>h.position.x){
								g.position.x=h.position.x
							}
							if(g.position.y>h.position.y){
								g.position.y=h.position.y
							}
						});
						this.elements={
							containerX:(new Element("div")).addClass(this.cls.x).inject(this.mapContainer.containerRender,"bottom").setStyles({
								position:"absolute",
								left:0,
								right:0,
								width:this.mapContainer.containerViewSize.width,overflow:"hidden"
							}),
							containerY:(new Element("div")).addClass(this.cls.y).inject(this.mapContainer.containerRender,"bottom").setStyles({
								position:"absolute",
								top:0,
								bottom:0,
								height:this.mapContainer.containerViewSize.height,
								overflow:"hidden"
							})
						};
						this.containerSize={
							width:this.elements.containerY.getDimensions({
								computeSize:true
							}).width,height:this.elements.containerX.getDimensions({
								computeSize:true
							}).height
						};
						this.elements.containerX.setStyles({
							height:this.containerSize.height
						});
						if(this.direction.toLowerCase()=="ltr"){
							this.elements.containerY.setStyles({
								left:-this.containerSize.width
							})
						}else{
							if(this.direction.toLowerCase()=="rtl"){
								this.elements.containerY.setStyles({
									right:-this.containerSize.width
								})
							}
						}
						this.elements.moverX=new Element("div",{
							styles:{
								position:"absolute",
								left:0,
								top:0,
								width:this.mapContainer.containerSize.width+2*this.mapContainer.blockSize.width,
								height:"100%",
								backgroundPosition:"left top",
								backgroundColor:"transparent",
								backgroundRepeat:"repeat-x"
							}
						}).inject(this.elements.containerX,"bottom");
						this.elements.moverY=new Element("div",{
							styles:{
								position:"absolute",
								left:0,
								top:0,
								width:"100%",
								height:this.mapContainer.containerSize.height+2*this.mapContainer.blockSize.height,
								backgroundPosition:"left top",
								backgroundColor:"transparent",
								backgroundRepeat:"repeat-y"
							}
						}).inject(this.elements.containerY,"bottom");
						f(this);
						d(this);
						c(this);
						return this
					},
					move:function(g){
						this.position.x+=g.x;
						this.position.y-=g.y;
						c(this);
						return this
					},
					zoom:function(){
						f(this);
						d(this);
						c(this);
						return this
					}
				})
			})();
			Travian.Game.Map.MiniMap=(function(){
				var c=Travian.emptyFunction;
				if(Browser.Engine.presto){
					c=function(f){
						var d=f.elements.background.getStyle("bottom");
						f.elements.background.setStyles({bottom:0});
						(function(){
							f.elements.background.setStyles({bottom:d})
						}).delay(0.1)
					}
				}
				var b=function(l){
					var g=l.transition.translateToMap({
						x:-l.mapContainer.elementSize.x,
						y:-l.mapContainer.elementSize.y
					},false);
					var k=l.transition.translateToMap({
						x:0,
						y:0,
						width:l.mapContainer.containerViewSize.width,
						height:l.mapContainer.containerViewSize.height
					},{
						round:false,
						correct:false
					});
					k.width=k.right-k.x;
					k.height=k.bottom-k.y;
					var j={
						x:l.containerSize.width/l.transition.border.width,
						y:l.containerSize.height/l.transition.border.height
					};
					l.position.width=k.width*j.x;
					l.position.height=k.height*j.y;
					l.position.x=g.x*j.x;
					l.position.x+=l.containerSize.width/2;
					l.position.y=-g.y*j.y;
					l.position.y+=l.containerSize.height/2;
					var h={
						x:l.position.x-l.elementSize["border-left-width"],
						y:l.position.y-l.elementSize["border-top-width"]-l.elementSize["border-bottom-width"],
						width:l.position.width+l.elementSize["border-left-width"]+l.elementSize["border-right-width"],
						height:l.position.height+l.elementSize["border-top-width"]+l.elementSize["border-bottom-width"]
					};
					if(h.width>=l.containerSize.width){
						h.x=-1
					}
					if(h.height>=l.containerSize.height){
						h.y=-1
					}
					l.element.setStyles({
						left:h.x,
						top:h.y,
						width:h.width,
						height:h.height
					});
					var f=$clone(h);
					var d=false;
					if(h.width>=l.containerSize.width){
						d=true
					}else{
						if(h.x<0){
							h.x+=l.containerSize.width;
							d=true
						}else{
							if(h.x+h.width>l.containerSize.width){
								h.x-=l.containerSize.width;
								d=true
							}
						}
					}
					if(h.height>=l.containerSize.height){
						d=true
					}else{
						if(h.y<0){
							h.y+=l.containerSize.height;
							d=true
						}else{
							if(h.y+h.height>l.containerSize.height){
								h.y-=l.containerSize.height;
								d=true
							}
						}
					}
					l.elementHelpers[0].setStyles({
						left:h.x,
						top:h.y,
						width:h.width,
						height:h.height,
						display:d?"block":"none"
					});
					l.elementHelpers[1].setStyles({
						left:f.x,
						top:h.y,
						width:h.width,
						height:h.height,
						display:(h.x<0&&h.y<0&&h.x+h.width>0&&h.y+h.height>0)?"block":"none"
					});
					l.elementHelpers[2].setStyles({
						left:h.x,
						top:f.y,
						width:h.width,
						height:h.height,
						display:(h.x<0&&h.y<0&&h.x+h.width>0&&h.y+h.height>0)?"block":"none"
					})
				};
				var a=function(g,f){
					var d={
						x:f.containerSize.width/f.transition.border.width,
						y:f.containerSize.height/f.transition.border.height
					};
					return{
						x:Math.floor((g.page.x-f.containerPosition.x)/d.x-Math.abs(f.transition.border.left)),
						y:-Math.floor((g.page.y-f.containerPosition.y)/d.y-Math.abs(f.transition.border.top))
					}};
					return new Class({
						Extends:Travian.Game.Map.Base,
						classType:"Travian.Game.Map.MiniMap",
						expanded:false,
						animate:function(){
							var d=this;
							if(this.elements.headlineExpander._fx&&this.elements.headlineExpander._fx.cancel){
								this.elements.headlineExpander._fx.cancel()
							}
							if(this.elements.headlineExpander.hasClass("expand")){
								this.expanded=true;
								this.cookie.set("minimap-expanded",true);
								this.elements.headlineExpander.removeClass("expand").addClass("collapse");
								this.elements.headlineExpander._fx=(new Fx.Morph(this.elements.container,{
									onComplete:function(){
										c(d)
									}
								})).start({
									height:[this.elements.container.getSize().y,this.elements.container._height.max]
								});
								this.parentContainer.outline.update(this.elements.container.getSize().y-this.elements.container._height.max)
							}else{
								this.expanded=false;
								this.cookie.set("minimap-expanded",false);
								this.elements.headlineExpander.removeClass("collapse").addClass("expand");
								this.elements.headlineExpander._fx=(new Fx.Morph(this.elements.container,{
									onComplete:function(){
										c(d)
									}
								})).start({
									height:[this.elements.container.getSize().y,this.elements.container._height.min]
								});
								this.parentContainer.outline.update(this.elements.container.getSize().y-this.elements.container._height.min)
							}
							return this
						},
						getContentForTooltip:function(d,g){
							var f=a(g,this);
							return{
								text:this.tooltipHtml.substitute(f)
							}
						},
						initialize:function(d,f){
							this.parent(d,f);
							this.position={
								x:0,
								y:0,
								width:0,
								height:0
							}
						},
						render:function(){
							var g=this;
							this.container=$(this.container).setStyles({overflow:"hidden"}).disableSelection().addEvent("click",function(j){
								g.mapContainer.moveTo(a(j,g))
							});
							this.parent({nodeType:"div"}).element.addClass("view").setStyles({position:"absolute",zIndex:3}).inject(this.container,"bottom");
							(new Element("div",{
								"class":"inner",
								styles:{
									height:"100%",
									opacity:0.25,
									width:"100%"
								}
							})).inject(this.element,"bottom");
							this.elementHelpers=[];
							for(var f=0;f<3;f++){
								var d=(new Element("div",{
									"class":"view",
									styles:{
										position:"absolute",
										zIndex:3,
										display:"none"
									}
								})).inject(this.container,"bottom");
								(new Element("div",{
									"class":"inner",
									styles:{
										height:"100%",
										opacity:0.25,
										width:"100%"
									}
								})).inject(d,"bottom");
								this.elementHelpers.push(d)
							}
							this.containerSize=this.container.getDimensions({
								computeSize:!Browser.Engine.webkit
							});
							this.containerPosition=this.container.getPosition();
							this.elementSize=this.element.getDimensions({computeSize:true});
							if(this.showToolTip){
								Travian.Game.Map.Tips.render(this,this.container.down("img"))
							}
							b(this);
							this.elements={
								container:$(this.containerContent),
								headline:$(this.containerContent).down(".headline"),
								headlineExpander:$(this.containerContent).down(".headline").down(".iconButton"),
								background:$(this.containerContent).down(".background")
							};
							this.elements.headlineExpander.addClass(this.cookie.get("minimap-expanded")===true?"collapse":"expand");
							var h=function(){
								g.elements.container._height={
									max:g.elements.container.getSize().y,
									min:g.elements.headline.getSize().y+parseInt(g.elements.headline.getStyle("margin-top"))+parseInt(g.elements.headline.getStyle("margin-bottom"))
								};
								if(g.elements.container._height.min<0){
									g.elements.container._height.min=0
								}
								if(g.elements.container._height.max<0){
									g.elements.container._height.max=0
								}
								if(g.cookie.get("minimap-expanded")!==true){
									g.elements.container.setStyles({
										height:g.elements.container._height.min
									});
									c(g)
								}
								g.elements.headlineExpander.addEvent("click",function(j){
									g.animate()
								})
							};
							if(Browser.Engine.webkit){
								h.delay(300)
							}else{
								h()
							}
						},
						move:function(){
							b(this);
							return this
						},
						zoom:function(){
							b(this);
							return this
						}
					})
				})();
			Travian.Game.Map.Toolbar=new Class({
				Extends:Travian.Game.Map.Base,
				classType:"Travian.Game.Map.Toolbar",
				initialize:function(a,b){
					this.parent(a,b)
				},
				render:function(){
					var c=this;
					var a=null;
					this.element=$(this.element);
					this.zoomIn=this.element.down(".zoomIn").addEvent("click",function(d){
						c.mapContainer.zoomIn()
					});
					this.zoomOut=this.element.down(".zoomOut").addEvent("click",function(d){
						c.mapContainer.zoomOut()
					});
					var b=function(){
						c.zoomDropDownDataContainer._dropped=false;
						c.zoomDropDownDataContainer.setStyles({
							height:c.zoomDropDownDataContainer._styleBackup.height
						});
						c.zoomDropDownEntries.each(function(d){
							if(d.hasClass("selected")){
								d.addClass("display")
							}
							d.addClass("hide").removeClass("selected")
						});
						c.zoomDropDownEntries[c.transition.zoomLevel-1].removeClass("hide").addClass("display")
					};
					this.zoomDropDownDataContainer=this.element.down(".dropdown .dataContainer");
					this.zoomDropDownEntries=this.zoomDropDownDataContainer.getElements(".entry");
					this.zoomDropDownDataContainer._styleBackup={
						height:this.zoomDropDownDataContainer.getStyle("height"),
						maxHeight:$A(this.zoomDropDownEntries).inject(0,function(f,d){
							return f+parseInt(d.getStyle("height"))
						})
					};
					this.zoomDropDownClick=this.element.down(".dropdown .dropDownImage").addEvent("click",function(d){
						if(!c.mapContainer.isEventsEnabled()){
							return
						}
						d.stop();
						if(c.zoomDropDownDataContainer._dropped){
							b();
							return
						}
						c.zoomDropDownDataContainer._dropped=true;
						c.zoomDropDownEntries.each(function(f){
							if(f.hasClass("display")){
								f.addClass("selected")
							}
							f.removeClass("display").removeClass("hide")
						});
						c.zoomDropDownDataContainer.setStyles({
							height:Browser.Engine.presto?"auto":c.zoomDropDownDataContainer._styleBackup.maxHeight
						})
					});
					this.zoomDropDownEntries.each(function(f,d){
						f.addEvent("click",function(g){
							g.stop();
							if(!c.zoomDropDownDataContainer._dropped){
								return
							}
							c.zoomDropDownDataContainer._dropped=false;
							c.zoomDropDownDataContainer.setStyles({
								height:c.zoomDropDownDataContainer._styleBackup.height
							});
							c.zoomDropDownEntries.each(function(h){
								h.addClass("hide").removeClass("selected")
							});
							f.removeClass("hide").addClass("display");
							c.mapContainer.zoom(d+1-c.mapContainer.transition.zoomLevel,
							c.mapContainer.transition.getPointOfCenterInView())
						})
					});
					$(document.body).addEvent("click",function(){
						if(c.zoomDropDownDataContainer._dropped){
							b();
							return
						}
					});
					a=this.element.down(".viewFull");
					if(a){
						this.viewFull=a.addEvent("click",function(d){
							window.location.href=c.viewFullScreenUrl.substitute($merge(c.mapContainer.transition.getPointOfCenterInView(),{
								zoom:c.mapContainer.transition.zoomLevel
							}))
						})
					}
					a=this.element.down(".viewNormal");
					if(a){
						this.viewNormal=this.element.down(".viewNormal").addEvent("click",function(d){
							window.location.href=c.viewNormalUrl.substitute($merge(c.mapContainer.transition.getPointOfCenterInView(),{
								zoom:c.mapContainer.transition.zoomLevel
							}))
						})
					}
					this.filterPlayer=this.element.down(".filterMy").addEvent("click",function(d){
						Travian.ajax({
							data:{
								cmd:"mapSetting",
								data:{
									type:"outline",
									outline:"user"
								}
							},
							onSuccess:function(f){
								c.filterPlayer[f.result?"addClass":"removeClass"]("checked");
								c.filterPlayer.checked=f.result;
								c.mapContainer.forceUpdateBlocksLayer("imageMark").forceUpdateBlocksSymbols("player",f.result)
							}
						})
					});
					this.filterPlayer.checked=this.filterPlayer.hasClass("checked");
					this.filterAlliance=this.element.down(".filterAlliance");
					if(!this.filterAlliance.hasClass("disabled")){
						this.filterAlliance.addEvent("click",function(d){
							Travian.ajax({
								data:{
									cmd:"mapSetting",
									data:{
										type:"outline",
										outline:"alliance"
									}
								},
								onSuccess:function(f){
									c.filterAlliance[f.result?"addClass":"removeClass"]("checked");
									c.filterAlliance.checked=f.result;
									c.mapContainer.forceUpdateBlocksLayer("imageMark").forceUpdateBlocksSymbols("alliance",f.result)
								}
							})
						});
						this.filterAlliance.checked=this.filterAlliance.hasClass("checked")
					}
					a=this.element.down(".linkCropfinder");
					if(a){
						a.addEvent("click",function(d){
							window.location.href="cropfinder.php"
						})
					}
					this.coordinateEnter=$("mapCoordEnter").addEvent("submit",function(d){
						var f={
							x:parseInt(c.coordinateEnter.down("input.coordinates.x").value),
							y:parseInt(c.coordinateEnter.down("input.coordinates.y").value)
						};
						if(!f.x.isNaN()&&!f.y.isNaN()){
							c.mapContainer.moveTo(f)
						}
						d.stop();
						return false
					});
					this.update()
				},
				update:function(){
					var a=this;
					if(this.transition.zoomLevel==1){
						this.zoomIn.addClass("disabled");
						this.zoomOut.removeClass("disabled")
					}else{
						if(this.transition.zoomLevel==this.transition.zoomOptions.sizes.length){
							this.zoomIn.removeClass("disabled");
							this.zoomOut.addClass("disabled")
						}else{
							this.zoomIn.removeClass("disabled");
							this.zoomOut.removeClass("disabled")
						}
					}
					this.zoomDropDownEntries.each(function(b){
						if(a.zoomDropDownDataContainer._dropped){
							b.removeClass("selected")
						}else{
							b.addClass("hide").removeClass("display")
						}
					});
					this.zoomDropDownEntries[this.transition.zoomLevel-1].removeClass("hide").addClass(this.zoomDropDownDataContainer._dropped?"selected":"display")
				},
				zoom:function(){
					this.update()
				}
			});
			Travian.Game.Map.Outline=(function(){
				var a=Travian.emptyFunction;
				if(Browser.Engine.presto){
					a=function(c){
						var b=c.elements.background.getStyle("top");
						c.elements.background.setStyles({top:0});
						(function(){
							c.elements.background.setStyles({top:b})
						}).delay(0.1)
					}
				}
				return new Class({
					Extends:Travian.Game.Map.Base,
					classType:"Travian.Game.Map.Outline",
					expanded:false,
					animate:function(){
						var b=this;
						if(this.elements.headlineExpander._fx&&this.elements.headlineExpander._fx.cancel){
							this.elements.headlineExpander._fx.cancel()
						}
						if(this.expanded==false){
							this.expanded=true;
							this.cookie.set("outline-expanded",true);
							this.elements.headlineExpander.removeClass("expand").addClass("collapse");
							this.elements.headlineExpander._fx=(new Fx.Morph(this.element,{
								onComplete:function(){
									a(b);
									$each(b.parentContainer.mapMarks,function(c){
										c.update(false)
									})
								}
							})).start({
								height:[this.element.getSize().y,
								this.element._height.max]
							})
						}else{
							this.expanded=false;
							this.cookie.set("outline-expanded",false);
							this.elements.headlineExpander.removeClass("collapse").addClass("expand");
							this.elements.headlineExpander._fx=(new Fx.Morph(this.element,{
								onComplete:function(){
									a(b)
								}
							})).start({
								height:[this.element.getSize().y,
								this.element._height.min]
							})
						}
						return this
					},
					initialize:function(b,c){
						this.parent(b,c);
						this.render()
					},
					render:function(){
						var b=this;
						this.selector="#"+this.element;
						this.element=$(this.element);
						this.elements={
							headline:this.element.down(".headline"),
							headlineExpander:this.element.down(".headline").down(".iconButton"),
							tabContainer:this.element.down(".tabContainer"),
							mapMarks:this.element.down("#mapMarks"),
							background:this.element.down(".background")
						};
						this.elements.headlineExpander.addClass(this.cookie.get("outline-expanded")===true?"collapse":"expand");
						var c=function(){
							b.element._height={
								max:b.parentContainer.containerViewSize.height-parseInt(b.element.getStyle("bottom"))-b.parentContainer.miniMap.elements.container.getSize().y-2,
								min:b.element.getSize().y
							};
							if(b.element._height.min<0){
								b.element._height.min=0
							}
							if(b.element._height.max<0){
								b.element._height.max=0
							}
							if(b.cookie.get("outline-expanded")===true){
								b.expanded=true;
								b.element.setStyles({
									height:b.element._height.max
								});
								$each(b.parentContainer.mapMarks,function(d){
									d.update(false)
								});
								a(b)
							}
							b.elements.headlineExpander.addEvent("click",function(d){
								b.animate()
							})
							};
							if(Browser.Engine.webkit){
								c.delay(300)
							}else{
								c()
							}
							return this
						},
						update:function(b){
							var c=this;
							this.element._height.max+=b;
							if(this.element._height.min<0){
								this.element._height.min=0
							}
							if(this.element._height.max<0){
								this.element._height.max=0
							}
							if(this.expanded){
								if(this.elements.headlineExpander._fx&&this.elements.headlineExpander._fx.cancel){
									this.elements.headlineExpander._fx.cancel()
								}
								this.elements.headlineExpander._fx=(new Fx.Morph(this.element,{
									onComplete:function(){
										$each(c.parentContainer.mapMarks,function(d){
											d.update(false)
										});
										a(c)
									}
								})).start({
									height:[this.element.getSize().y,this.element._height.max]
								})
							}
							return this
						}
					})
			})();
			Travian.Game.Map.Layer=(function(){
				return new Class({
					Extends:Travian.Game.Map.Base,
					element:null,
					index:null,
					position:null,
					classType:"Travian.Game.Map.Layer",
					finishedLoading:function(){
						return this
					},
					forceUpdateContent:function(){
						return this
					},
					getContentForTooltip:function(a){
						return false
					},
					getRequestData:function(){
						return false
					},
					hide:function(){
						this.element.hide();
						return this
					},
					initialize:function(a,c){
						this.parent(a,c);
						if(this.position==null&&this.parentContainer!=null){
							var b=this.parentContainer.element.getSize();
							this.position={
								x:0,
								y:0,
								width:b.x,
								height:b.y
							}
						}
						if(this.parentContainer.classType=="Travian.Game.Map.Layer.Block"){
							this.blockContainer=this.parentContainer
						}else{
							if(this.parentContainer.blockContainer){
								this.blockContainer=this.parentContainer.blockContainer
							}
						}
						if(typeof a.version!="undefined"){
							this.setVersion(a.version)
						}
						this.render()
					},
					refreshContent:function(){
						return this
					},
					render:function(a){
						this.parent(a);
						if(this.id!=null){
							this.element.addClass(this.id)
						}
						if(this.position){
							this.element.setStyles({
								position:"absolute",
								left:this.position.x,
								top:this.position.y,
								width:this.position.width,
								height:this.position.height
							})
						}
						if(this.zIndex){
							this.element.setStyles({
								zIndex:this.zIndex+1
							})
						}
						if(this.parentContainer&&this.parentContainer.element){
							this.element.inject(this.parentContainer.element,"bottom")
						}
						return this
					},
					setVersion:function(a){
						return this
					},
					show:function(){
						this.element.show();
						return this
					},
					update:function(){
						this.element.setStyles({
							left:this.position.x+"px",
							top:this.position.y+"px"
						});
						return this
					},
					updateContent:function(){
						return this
					}
				})
			})();
			Travian.Game.Map.Layer.Block=(function(){
				var b=function(m,l,k){
					if(typeof l.x=="undefined"){l.x=k.x}
					if(typeof l.y=="undefined"){l.y=k.y}
					l=Travian.Game.Map.remapShortParameters(l);
					if(typeof l.text=="undefined"&&typeof l.title=="undefined"){
						l.text=m.tooltipHtml.substitute(l.position)
					}
					return l
				};
				var c=function(s,q){
					var m=$clone(q);
					var l=s.transition.getPointOfCenterInView();
					var n=$clone(s.mapCoordinates);
					m.x=parseFloat(m.x);
					m.y=parseFloat(m.y);
					l.x=parseFloat(l.x);
					l.y=parseFloat(l.y);
					n.x=parseFloat(n.x);
					n.y=parseFloat(n.y);
					var o={
						x:(s.transition.border.right-Math.abs(m.x)<s.transition.border.right/2),
						y:(s.transition.border.bottom-Math.abs(m.y)<s.transition.border.bottom/2)
					};
					var r={
						x:(s.transition.border.right-Math.abs(l.x)<s.transition.border.right/2),
						y:(s.transition.border.bottom-Math.abs(l.y)<s.transition.border.bottom/2)
					};
					var k={
						x:(s.transition.border.right-Math.abs(n.x)<s.transition.border.right/2),
						y:(s.transition.border.bottom-Math.abs(n.y)<s.transition.border.bottom/2)
					};
					if((o.x||r.x)&&(m.x.sgn()+l.x.sgn()==0&&m.x.sgn()!=l.x.sgn())){
						m.x+=l.x.sgn()*s.transition.border.width
					}
					if((o.y||r.y)&&(m.y.sgn()+l.y.sgn()==0&&m.y.sgn()!=l.y.sgn())){
						m.y+=l.y.sgn()*s.transition.border.height
					}
					if((k.x||r.x)&&(n.x.sgn()+l.x.sgn()==0&&n.x.sgn()!=l.x.sgn())){
						n.x+=l.x.sgn()*s.transition.border.width
					}
					if((k.y||r.y)&&(n.y.sgn()+l.y.sgn()==0&&n.y.sgn()!=l.y.sgn())){
						n.y+=l.y.sgn()*s.transition.border.height
					}
					return{
						x:(m.x-n.x)*s.transition.pixelPerTile.x,
						y:(s.transition.elementsPerBlock.y-(m.y-n.y)-1)*s.transition.pixelPerTile.y
					}
				};
				var h=function(s,q,m){
					if(!q.type){
						throw"Missing symbol type for symbol: "+q.dataId;
						return
					}
					var o=s.symbolTypes[q.type];
					if(!o||!o["class"]||!o.visibleInZoom[s.transition.zoomLevel]){return}
					if(!s.symbols[q.position.x]){
						s.symbols[q.position.x]={}
					}
					if(!s.symbols[q.position.x][q.position.y]){
						s.symbols[q.position.x][q.position.y]=$H({})
					}
					var n=o.sizes[s.transition.zoomLevel];
					var r=c(s,m);
					var l=s.symbols[q.position.x][q.position.y];
					var k=f(s,o,l);
					l[q.dataId]=new o["class"]($merge(o,q,{
						positionOfTile:{
							x:r.x,
							y:r.y
						},
						positionInTile:k,
						position:{
							x:r.x+k.x,
							y:r.y+k.y,
							width:o.sizes[s.transition.zoomLevel].width,
							height:o.sizes[s.transition.zoomLevel].height
						},
						positionDefault:{
							x:r.x+k.x,
							y:r.y+k.y,
							width:o.sizes[s.transition.zoomLevel].width,
							height:o.sizes[s.transition.zoomLevel].height
						},
						symbolSize:{
							width:o.sizes[s.transition.zoomLevel].width,
							height:o.sizes[s.transition.zoomLevel].height
						}
					}),s)
				};
				var g=function(k){
					j(k);
					k.symbols={};
					k.dataStore.getDataForArea(Travian.Game.Map.DataStore.TYPE_SYMBOL,k.mapCoordinates,true).each(function(l){
						h(k,l,l.position)
					})
				};
				var j=function(k){
					if(k.symbols){
						$each(k.symbols,function(l){
							$each(l,function(m){
								m.each(function(n){
									n.destroy();
									delete (m[n.dataId])
								})
							})
						});
						delete (k.symbols)
					}
				};
				var f=function(q,o,l){
					var k={x:false,y:false};
					var m=o.sizes[q.transition.zoomLevel].width;
					var n=l.getKeys().reverse().find(function(r){
						return l[r].position.x==l[r].positionDefault.x&&l[r].position.y==l[r].positionDefault.y&&l[r].position.width==l[r].positionDefault.width&&l[r].position.height==l[r].positionDefault.height
					});
					if(n){
						k.x=l[n].positionInTile.x;
						k.x+=m
					}
					if(k.x===false){
						k.x=0
					}
					if(k.x+m>(q.position.width/q.transition.elementsPerBlock.x)){
						k.x=0;
						k.y+=o.sizes[q.transition.zoomLevel].height
					}
					return k
				};
				var a=function(m,k,l){
					if(typeof l=="undefined"){
						l={}
					}
					if(typeof l.tiles!="undefined"&&l.tiles.length!=0){
						$each(l.tiles,function(n){
							n=b(m,n,k);
							if(n.position.x==k.x&&n.position.y==k.y){
								l.tile=n
							}
							m.dataStore.set({
								position:n.position,
								type:Travian.Game.Map.DataStore.TYPE_TOOLTIP,
								data:n
							})
						})
					}
					if(typeof l.tile=="undefined"){
						l.tile={};
						l.tile=b(m,l.tile,k);
						m.dataStore.set({
							position:l.tile.position,
							type:Travian.Game.Map.DataStore.TYPE_TOOLTIP,
							data:l.tile
						})
					}
					if(typeof l.tiles!="undefined"||typeof l.tile=="undefined"){
						m.dataStore.saveDataToStorage()
					}
					if(m.mapContainer.currentMousePosition.map.x==null||m.mapContainer.currentMousePosition.map.y==null){
						return
					}
					if(k.x!=m.mapContainer.currentMousePosition.map.x||k.y!=m.mapContainer.currentMousePosition.map.y){
						return
					}
					m.mapContainer.containerMover.setTitle({
						unescaped:true,
						title:l.tile.title,
						text:l.tile.text
					});
					m.mapContainer.contextMenu.update()
				};
				var d=function(m,k,l){
					if(m.mapContainer.currentMousePosition.map.x==null||m.mapContainer.currentMousePosition.map.y==null){
						return
					}
					if(k.x!=m.mapContainer.currentMousePosition.map.x||k.y!=m.mapContainer.currentMousePosition.map.y){
						return
					}
					m.mapContainer.containerMover.setTitle({
						title:"",
						text:"{x}|{y}".substitute(k)
					})
				};
				return new Class({
					Extends:Travian.Game.Map.Layer,
					mapCoordinates:null,
					layers:null,
					versionCache:null,
					classType:"Travian.Game.Map.Layer.Block",
					addSymbol:function(k){
						h(this,k,k.position);
						return this
					},
					deleteSymbol:function(k){
						if(!this.symbols||!this.symbols[k.position.x]||!this.symbols[k.position.x][k.position.y]){
							return this
						}
						if(this.symbols[k.position.x][k.position.y][k.dataId]){
							this.symbols[k.position.x][k.position.y][k.dataId].destroy();
							delete (this.symbols[k.position.x][k.position.y][k.dataId])
						}
						return this
					},
					forceUpdateLayer:function(k){
						if(this.layers[k]){
							this.layers[k].forceUpdateContent()
						}
						return this
					},
					forceUpdateSymbols:function(l,k){
						if(this.symbols){
							$each(this.symbols,function(m){
								$each(m,function(n){
									n.each(function(o){
										if(o.layer==l){
											o.forceUpdate(k)
										}
									})
								})
							})
						}
						return this
					},
					getContentForTooltip:function(k){
						var o=this;
						var l=this.transition.translateToMap(k);
						if(this.symbols&&this.symbols[l.x]&&this.symbols[l.x][l.y]&&this.symbols[l.x][l.y]!=0){
							var q=false;
							var n=this.symbols[l.x][l.y].find(function(r){
								q=r.getContentForTooltip();
								return q!==false&&r.isPositionInRect({
									x:k.x-o.position.x,
									y:k.y-o.position.y
								})
							});
							if(n&&q!==false){
								return q
							}
						}
						var m=this.dataStore.get(Travian.Game.Map.DataStore.TYPE_TOOLTIP,l);
						if(m!=null&&(m.text!=undefined||m.title!=undefined)){
							m={
								text:m.text,
								title:m.title
							}
						}else{
							m={
								title:"",
								text:this.tooltipHtml.translate(l)
							};
							this.requestDataForPosition(l)
						}
						return m
					},
					getData:function(){
						return $merge({
							loaded:false,
							version:0
						},
						this.dataStore.get(Travian.Game.Map.DataStore.TYPE_BLOCKS,this.mapCoordinates,"block")||{})
					},
					getRequestData:function(){
						return{
							position:{
								x0:this.mapCoordinates.x,
								y0:this.mapCoordinates.y,
								x1:this.mapCoordinates.right,
								y1:this.mapCoordinates.bottom
							}
						}
					},
					getVersion:function(){
						if(this.versionCache==null){
							this.versionCache=this.getData().version
						}
						return this.versionCache
					},
					invalidateVersionCache:function(){
						this.versionCache=null;
						return this
					},
					move:function(l){
						if(l.x==0&&l.y==0){
							return this
						}
						this.position.x+=l.x;
						this.position.y-=l.y;
						var k=Travian.Game.Map.Layer.Block.getCorrectPosition(this.position,this.mapContainer);
						this.position=k.position;
						this.mapCoordinates=this.transition.translateToMap(this.position);
						this.update(k.updateInnerContent);
						return this
					},
					refreshContent:function(k){
						if(k){
							var l=this.getData();
							l.loaded=true;
							this.setData(l)
						}
						this.parent();
						$each(this.layers,function(m){
							m.refreshContent()
						});
						g(this);
						return this
					},
					render:function(){
						var l=this;
						this.layers={};
						this.parent({
							nodeType:"div"
						});
						this.mapCoordinates=this.transition.registerCallbackOnZoom(function(){
							l.mapCoordinates=l.transition.translateToMap(l.position);
							l.update(true)
						}).translateToMap(this.position);
						this.mapContainer.layers.each(function(n,m){
							if(!n["class"]){
								return
							}
							var o={};
							$extend(o,n);
							o.index=m;
							l.layers[o.id]=new n["class"](o,l)
						});
						var k=this.getData();
						k.loaded=true;
						this.setData(k);
						g(this);
						return this
					},
					requestDataForPosition:function(k){
						var l=this;
						this.updater.requestPosition({
							dataStoreType:Travian.Game.Map.DataStore.TYPE_TOOLTIP,
							position:k,
							onSuccess:function(n,m){
								a(l,k,n)
							},
							onFailure:function(n,m){
								d(l,k,n)
							}
						});
						return this
					},
					setData:function(k){
						this.dataStore.push({
							type:Travian.Game.Map.DataStore.TYPE_BLOCKS,
							position:this.mapCoordinates,
							index:"block",
							data:$merge({
								loaded:false,
								version:0
							},k)
						});
						return this
					},
					setVersion:function(k){
						var l=this.getData();
						l.version=k;
						return this.setData(l)
					},
					update:function(k){
						this.parent();
						this.updateContent(k);
						return this
					},
					updateContent:function(k){
						this.parent();
						$each(this.layers,function(l){
							l.updateContent(k)
						});
						if(k){
							j(this);
							if(this.getData.loaded){
								this.refreshContent(false)
							}else{
								this.updater.register("ajax",this)
							}
						}
						return this
					},
					updateSymbolData:function(k){
						if(!this.symbols||!this.symbols[k.position.x]||!this.symbols[k.position.x][k.position.y]){
							return this
						}
						if(this.symbols[k.position.x][k.position.y][k.dataId]){
							this.symbols[k.position.x][k.position.y][k.dataId].updateData(k)
						}
						return this
					}
				})
			})();
			Travian.Game.Map.Layer.Block.getCorrectPosition=function(b,c){
				var a={
					position:b,
					updateInnerContent:false,
					updateBlockPosition:false
				};
				do{
					a.updateBlockPosition=false;
				if(a.position.x<0&&Math.abs(a.position.x)>=c.blockSize.width){
					a.position.x=c.elementSize.width+a.position.x;
					a.updateInnerContent=true;
					a.updateBlockPosition=true
				}else{
					if(a.position.x+a.position.width>c.elementSize.width){
						a.position.x=a.position.x-c.elementSize.width;
						a.updateInnerContent=true;
						a.updateBlockPosition=true
					}
				}
				if(a.position.y<0&&Math.abs(a.position.y)>=c.blockSize.height){
					a.position.y=c.elementSize.height+a.position.y;
					a.updateInnerContent=true;
					a.updateBlockPosition=true
				}else{
					if(a.position.y+a.position.height>c.elementSize.height){
						a.position.y=a.position.y-c.elementSize.height;
						a.updateInnerContent=true;
						a.updateBlockPosition=true
					}
				}
			}
			while(a.updateBlockPosition);
			return a
		};
		Travian.Game.Map.Layer.Image=new Class({
			Extends:Travian.Game.Map.Layer,
			image:null,
			srcUrl:null,
			classType:"Travian.Game.Map.Layer.Image",
			getPriority:function(){
				var c={
					x:this.blockContainer.mapCoordinates.x+(this.blockContainer.mapCoordinates.right-this.blockContainer.mapCoordinates.x)/2,
					y:this.blockContainer.mapCoordinates.y+(this.blockContainer.mapCoordinates.bottom-this.blockContainer.mapCoordinates.y)/2
				};
				var a=this.transition.getPointOfCenterInView();
				var b={
					x:a.x-c.x,
					y:a.y-c.y
				};
				return Math.pow(b.x,2)+Math.pow(b.y,2)
			},
			getSrcUrl:function(){
				return this.src.substitute({
					x:this.parentContainer.mapCoordinates.x,
					y:this.parentContainer.mapCoordinates.y,
					right:this.parentContainer.mapCoordinates.right,
					bottom:this.parentContainer.mapCoordinates.bottom,
					width:this.position.width,
					height:this.position.height,
					time:this.time,
					forcedUpdates:this.mapContainer.forcedUpdates,
					version:this.blockContainer.getVersion()
				})
			},
			refreshSrcUrl:function(){
				this.srcUrl=this.getSrcUrl();
				return this
			},
			render:function(){
				var a=this;
				this.parent({
					nodeType:"img"
				});
				if(this.srcInit){
					this.element.src=this.srcInit
				}
				this.time=(new Date()).getTime();
				this.updateContent();
				return this
			},
			updateContent:function(a){
				var b=this.getSrcUrl();
				if(this.srcUrl!=b||a){
					this.refreshSrcUrl();
					this.updater.register("images",this)
				}
				return this
			}
		});
		Travian.Game.Map.Layer.ImageMark=new Class({
			Extends:Travian.Game.Map.Layer.Image,
			classType:"Travian.Game.Map.Layer.ImageMark",
			finishedLoading:function(){
				this.parent();
				this.show();
				return this
			},
			forceUpdateContent:function(){
				this.time=(new Date()).getTime();
				this.updateContent(true);
				return this
			},
			updateContent:function(a){
				this.parent(a);
				if(a){
					this.hide()
				}
				return this
			}
		});
		Travian.Game.Map.Layer.Loading=new Class({
			Extends:Travian.Game.Map.Layer,
			classType:"Travian.Game.Map.Layer.Loading",
			render:function(){
				this.parent({
					nodeType:"div"
				}).element.setStyles(this.styles).hide();
				return this
			},
			updateContent:function(a){
				return this
			}
		});
		Travian.Game.Map.Layer.Symbol=new Class({
			Extends:Travian.Game.Map.Layer,
			byUser:false,
			classType:"Travian.Game.Map.Layer.Symbol",
			visible:true,
			destroy:function(){
				if(this.element){
					this.element.destroy()
				}
				return this
			},
			forceUpdate:function(a){
				if(this.byUser){
					this.visible=a;
					this.element[a?"show":"hide"]()
				}
				return this
			},
			getContentForTooltip:function(){
				if(this.visible&&(this.title||this.text)){
					return{
						title:this.title,
						text:this.text
					}
				}
				return false
			},
			initialize:function(a,c){
				var b=this;
				a.mapCoordinates=a.mapCoordinates||c.transition.translateToMap({
					x:a.position.x+c.position.x,
					y:a.position.y+c.position.y
				});
				a.id=a.id||Travian.Game.Map.getNewId();
				a.parameters=a.parameters||{};
				this.parent(a,c)
			},
			render:function(){
				this.parent({
					nodeType:"img"
				}).element.set("src",this.imgSource.substitute($merge(this.parameters,{
					width:this.symbolSize.width,
					height:this.symbolSize.height,
					zoomLevel:this.transition.zoomLevel
				}))).setStyles({
					position:"absolute",
					left:this.position.x,
					top:this.position.y,
					width:this.position.width,
					height:this.position.height
				});
				return this
			},
			updateData:function(a){
				this.title=a.title;
				this.text=a.text
			}
		});
		Travian.Game.Map.Layer.Symbol.Flag=new Class({
			Extends:Travian.Game.Map.Layer.Symbol,
			classType:"Travian.Game.Map.Layer.Symbol.Flag",
			index:null,
			render:function(){
				this.parameters.index=this.index||1;
				this.parent();
				var a=Travian.Game.Map.Options.Toolbar;
				var b="filterPlayer";
				if(this.layer=="alliance"){
					var b="filterAlliance"
				}
				if(this.mapContainer.toolbar){
					a=this.mapContainer.toolbar
				}
				this.forceUpdate(a[b].checked)
			},
			updateData:function(a){
				this.parent(a);
				this.parameters.index=this.index=a.index;
				this.element.set("src",this.imgSource.substitute($merge(this.parameters,{
					zoomLevel:this.transition.zoomLevel,
					width:this.symbolSize.width,
					height:this.symbolSize.height
				})))
			}
		});
		Travian.Game.Map.Layer.Symbol.Attack=new Class({
			Extends:Travian.Game.Map.Layer.Symbol,
			classType:"Travian.Game.Map.Layer.Symbol.Attack"
		});
		Travian.Game.Map.Layer.Symbol.BattleGround=new Class({
			Extends:Travian.Game.Map.Layer.Symbol,
			classType:"Travian.Game.Map.Layer.Symbol.BattleGround",
			getContentForTooltip:function(){
				return false
			},
			render:function(){
				this.position={
					x:this.positionOfTile.x,
					y:this.positionOfTile.y,
					width:this.transition.pixelPerTile.x,
					height:this.transition.pixelPerTile.y
				};
				this.parent()
			}
		});
		Travian.Game.Map.Layer.Symbol.Adventure=new Class({
			Extends:Travian.Game.Map.Layer.Symbol,
			classType:"Travian.Game.Map.Layer.Symbol.Adventure",
			render:function(){
				this.position={
					x:this.positionOfTile.x+this.transition.pixelPerTile.x-this.position.width,
					y:this.positionOfTile.y+this.transition.pixelPerTile.y-this.position.height,
					width:this.position.width,
					height:this.position.height
				};
				this.parent()
			}
		});
		Travian.Game.Map.MapMark=new Class({
			Extends:Travian.Game.Map.Base,
			classType:"Travian.Game.Map.MapMark",
			initialize:function(a,b){
				this.parent(a,b);
				this.render()
			},
			render:function(){
				var a=this;
				this.element=$(this.element);
				$each(this.layers,function(c,b){
					a.layers[b]=new c["class"](c,a)
				});
				this.update(false);
				this.data.each(function(b){
					if(!b.layer||!a.layers[b.layer]){
						return
					}
					a.layers[b.layer].addData(b)
				});
				return this
			},
			update:function(d){
				var b=this.element.isDisplayed();
				this.element.show();
				var f=[];
				var a=this.element.getSize().y;
				var c=0;
				$each(this.layers,function(h,g){
					if(h.expanded){
						c++
					}
					f.push({
						layer:h,
						expanded:h.expanded,
						elementCollapse:h.elements.expandContainer,
						heightCurrent:h.elements.expandContainer.getSize().y
					});
					var j=h.element.getDimensions({
						computeSize:true
					});
					a-=(j.height-h.elements.expandContainer.getSize().y);
					a-=j["border-top-width"];
					a-=j["border-bottom-width"];
					a-=j["padding-top"];
					a-=j["padding-bottom"];
					a-=h.element.getStyle("margin-top").toInt();
					a-=h.element.getStyle("margin-bottom").toInt();
					if(h._fx&&h._fx.cancel){
						h._fx.cancel()
					}
				});
				if(c!=0){
					a=a/c-1
				}
				if(a<0){
					a=0
				}
				f.each(function(g){
					if(d===false){
						g.elementCollapse.setStyles({
							height:g.expanded?a:0
						});
						if(g.expanded){
							g.layer.jScroll.refresh()
						}
					}else{
						if(g.expanded){
							g._fx=new Fx.Morph(g.elementCollapse,{
								onComplete:function(){
									g.layer.jScroll.refresh()
								}
							}).start({
								height:[g.heightCurrent,a]
							})
						}else{
							if(!g.expanded){
								g._fx=new Fx.Morph(g.elementCollapse).start({
									height:[g.heightCurrent,0]
								})
							}
						}
					}
				}
			);
			if(b==false){
				this.element.hide()
			}
		}
	});
	Travian.Game.Map.MapMark.Layer=new Class({
		Extends:Travian.Game.Map.Base,
		classType:"Travian.Game.Map.MapMark.Layer",
		addData:function(a){
			return this
		},
		deleteData:function(a){
			if(this.datas[a.id]){
				delete (this.datas[a.id])
			}
			return this
		},
		initialize:function(b,c){
			this.parent(b,c);
			var a=this.cookie.get("markLayer-"+this.parentContainer.typeId+"-"+this.typeId+"-expanded");
			if(a!=null){
				this.expanded==a
			}
			this.datas={};
			this.render()
		},
		render:function(a){
			var b=this;
			this.element=(new Element("div")).addClass("collapseContainer").set("html",this.html.substitute($merge(a||{},{
				data:"dataContainer",
				add:"addButton",
				expandButton:"expandButton",
				expandContainer:"expandContainer",
				title:this.title
			}))).inject(this.parentContainer.element,"bottom");
			this.elements={
				data:this.element.down(".dataContainer"),
				add:this.element.down(".addButton"),
				expandButton:this.element.down(".expandButton"),
				expandContainer:this.element.down(".expandContainer")
			};
			if(!this.editable&&this.elements.add){
				this.elements.add.hide()
			}
			if(this.elements.expandButton){
				this.elements.expandButton.addClass(this.expanded?"collapse":"expand");
				this.elements.expandButton.addEvent("click",function(c){
					if(b.expanded){
					}else{
						$each(b.parentContainer.layers,function(d){
							d.expanded=false;
							d.elements.expandButton.removeClass("collapse").addClass("expand");
							b.cookie.set("markLayer-"+d.parentContainer.typeId+"-"+d.typeId+"-expanded",d.expanded)
						});
						b.expanded=true;
						b.elements.expandButton.removeClass("expand").addClass("collapse");
						b.cookie.set("markLayer-"+b.parentContainer.typeId+"-"+b.typeId+"-expanded",true)
					}
					b.parentContainer.update()
				})
			}
			this.jScroll=new jScroll({
				container:this.elements.expandContainer
			});
			return this
		}
	});
	Travian.Game.Map.MapMark.Layer.Mark=new Class({
		Extends:Travian.Game.Map.MapMark.Layer,
		classType:"Travian.Game.Map.MapMark.Layer.Mark",
		addData:function(a){
			var b=new Travian.Game.Map.MapMark.Layer.Data.Mark($merge(a,this.optionsData,{editable:this.editable}),this);
			this.datas[b.id]=b;
			return this
		},
		add:function(a){
			var b=this;
			if(!this.editable){
				return this
			}
			a=Travian.Game.Map.remapShortParameters(a);
			Travian.ajax({
				data:{
					cmd:"mapMultiMarkAdd",
					data:{
						x:a.position.x,
						y:a.position.y,
						type:this.typeId,
						color:a.color||0,
						owner:this.parentContainer.typeId,
						text:a.text||undefined,
						title:a.title||undefined
					}
				},
				onSuccess:function(c){
					b.addData(c);
					b.mapContainer.forceUpdateBlocksLayer("imageMark")
				}
			});
			return this
		},
		initialize:function(a,c){
			var b=this;
			this.parent(a,c);
			this.colorsArray=$A([]);
			$each(this.colors,function(d){
				if(typeof d=="string"){
					b.colorsArray.push(d)
				}
			})
		},
		render:function(){
			var a=this;
			this.parent();
			this.elements.add.addEvent("click",function(b){
				a.showDialog()
			});
			return this
		},
		showDialog:function(a){
			var b=this;
			a=$merge({
				color:this.color,
				onOkay:this.add.bind(this),
				onOpen:Travian.emptyFunction,
				position:{
					x:"",
					y:""
				}
			},
			a||{});
			this.color=a.color;
			this.dialog.html.substitute({
				select:"select",
				textX:this.dialog.textX,
				textY:this.dialog.textY,
				textDisplay:"textDisplay",
				coord:"coord",
				inputX:"inputX",
				inputY:"inputY"
			}).dialog({
				relativeTo:this.mapContainer.container,
				elementFocus:a.position.x==""?this.dialog.elementFocusNew:this.dialog.elementFocusEdit,
				buttonTextOk:this.dialog.textOkay,
				buttonTextCancel:this.dialog.textCancel,
				title:this.dialog.title,
				onOpen:function(d,f){
					f.down(".inputX").value=a.position.x;
					f.down(".inputY").value=a.position.y;
					var c=(new Travian.Game.ColorPicker(f.down(".select"),{
						colors:b.colorsArray,
						defaultColor:b.color
					})).addEvent("change",function(g,h){
						b.colorsArray.find(function(j,k){
							if(j==g){
								b.color=k
							}
						})
					});
					a.onOpen(d,f,c)
				},
				onOkay:function(c,d){
					a.onOkay({
						color:b.color,
						position:{
							x:d.down(".inputX").value,
							y:d.down(".inputY").value
						}
					},c,d)
				}
			});
			return this
		}
	});
	Travian.Game.Map.MapMark.Layer.Flag=new Class({
		Extends:Travian.Game.Map.MapMark.Layer,
		classType:"Travian.Game.Map.MapMark.Layer.Flag",
		add:function(a){
			var b=this;
			if(!this.editable){
				return this
			}
			a=Travian.Game.Map.remapShortParameters(a);
			if(a.index<this.indexes.min){
				a.index=this.indexes.max
			}
			if(a.index>this.indexes.max){
				a.index=this.indexes.min
			}
			Travian.ajax({
				data:{
					cmd:"mapFlagAdd",
					data:{
						x:a.position.x,
						y:a.position.y,
						color:a.index||this.indexes.min,
						owner:this.parentContainer.typeId,
						text:a.text||undefined,title:a.title||undefined
					}
				},
				onSuccess:function(c){
					c.type="flag";
					b.dataStore.push({
						type:Travian.Game.Map.DataStore.TYPE_SYMBOL,
						index:c.dataId,
						position:c.position,
						data:c,
						time:false
					});
					b.addData(c);
					c.position=a.position;
					c.layer=b.parentContainer.typeId;
					b.mapContainer.addSymbol(c)
				}
			});
			return this
		},
		addData:function(b){
			var a=new Travian.Game.Map.MapMark.Layer.Data.Flag($merge(b,this.optionsData,{editable:this.editable}),this);
			this.datas[a.id]=a;
			return this
		},
		initialize:function(a,c){
			this.parent(a,c);
			this.imagesArray=$A([]);
			for(var b=this.indexes.min;b<=this.indexes.max;b++){
				this.imagesArray.push(this.imgSource.substitute({index:b}))
			}
		},
		render:function(){
			var a=this;
			this.parent();
			this.elements.add.addEvent("click",function(b){a.showDialog()});
			return this
		},
		showDialog:function(a){
			var b=this;
			a=$merge({
				index:this.index,
				onOkay:this.add.bind(this),
				onOpen:Travian.emptyFunction,
				text:"",
				position:{
					x:"",
					y:""
				}
			},
			a||{});
			this.index=a.index;
			this.dialog.html.substitute({
				select:"select",
				textX:this.dialog.textX,
				textY:this.dialog.textY,
				textDisplay:"textDisplay",
				coord:"coord",
				inputX:"inputX",
				inputY:"inputY",
				inputText:"inputText"
			}).dialog({
				relativeTo:this.mapContainer.container,
				elementFocus:a.position.x==""?this.dialog.elementFocusNew:this.dialog.elementFocusEdit,
				buttonTextOk:this.dialog.textOkay,
				buttonTextCancel:this.dialog.textCancel,
				title:this.dialog.title,
				onOpen:function(d,f){
					f.down(".inputX").value=a.position.x;
					f.down(".inputY").value=a.position.y;
					f.down(".inputText").value=a.text;
					var c=(new Travian.Game.ImagePicker(f.down(".select"),{
						images:b.imagesArray,
						defaultImage:b.index-b.indexes.min
					})).addEvent("change",function(h,g){
						b.imagesArray.find(function(k,j){
							if(k==h){
								b.index=j+1
							}
						})
					});
					a.onOpen(d,f,c)
				},
				onOkay:function(c,d){
					if(b.index<b.indexes.min){
						b.index+=b.indexes.min-1
					}
					a.onOkay({
						index:b.index,
						text:d.down(".inputText").value,
						position:{
							x:d.down(".inputX").value,
							y:d.down(".inputY").value
						}
					},c,d)
				}
			});
			return this
		}
	});
	Travian.Game.Map.MapMark.Layer.Data=new Class({
		Extends:Travian.Game.Map.MapMark.Layer,
		classType:"Travian.Game.Map.MapMark.Layer.Data",
		del:function(){
			this.destroy();
			this.parentContainer.deleteData(this);
			return this
		},
		render:function(a){
			var b=this;
			this.element=(new Element("div")).set("html",this.html.substitute($merge(a||{},{
				entry:this.id,
				text:"textContainer",
				"delete":"deleteButton",
				select:"selectLink",
				editDelete:"editDeleteContainer"
			}))).inject(this.parentContainer.elements.data,"bottom");
			this.elements={
				text:this.element.down(".textContainer"),
				"delete":this.element.down(".deleteButton"),
				select:this.element.down(".selectLink"),
				editDelete:this.element.down(".editDeleteContainer")
			};
			this.elements["delete"].addEvent("click",function(c){
				b.del()
			});
			this.elements.text.set("html",this.text);
			if(!this.editable&&this.elements.editDelete){
				this.elements.editDelete.hide()
			}
			if(this.parentContainer.expanded){
				this.parentContainer.jScroll.refresh()
			}
			return this
		}
	});
	Travian.Game.Map.MapMark.Layer.Data.Mark=(function(){
		var a=function(b){
			b.elements.color.setStyles({
				backgroundColor:b.parentContainer.colors[b.color]
			})
		};
		return new Class({
			Extends:Travian.Game.Map.MapMark.Layer.Data,
			classType:"Travian.Game.Map.MapMark.Layer.Data.Mark",
			del:function(){
				var b=this;
				if(!this.editable){
					return this
				}
				Travian.ajax({
					data:{
						cmd:"mapMultiMarkDelete",
						data:{
							dataId:this.dataId,
							owner:this.parentContainer.parentContainer.typeId
						}
					},
					onSuccess:function(c){
						if(c.result){
							b.destroy();
							b.mapContainer.forceUpdateBlocksLayer("imageMark");
							if(b.parentContainer.expanded){
								b.parentContainer.jScroll.refresh()
							}
						}
					}
				});
				return this
			},
			initialize:function(b,c){
				b.color=Number(b.color);
				this.parent(b,c)
			},
			render:function(b){
				var c=this;
				this.parent({
					color:"colorContainer",
					urlLink:"urlLink"
				});
				this.elements.color=this.element.down(".colorContainer");
				this.elements.urlLink=this.element.down(".urlLink");
				if(this.elements.urlLink){
					this.elements.urlLink.href=this.urlLink.substitute({markId:this.markId})
				}
				if(this.editable){
					this.elements.select.addEvent("click",function(d){
						c.parentContainer.showDialog({
							color:c.color,
							onOpen:function(g,h,f){
								h.select(".coord").each(function(j){j.hide()});
								h.down(".textDisplay").show().set("html",c.text)
							},
							onOkay:function(f,g,h){
								c.setColor(f.color)
							}
						})
					})
				}
				a(this);
				return this
			},
			setColor:function(b){
				var c=this;
				if(!this.editable){
					return this
				}
				if(typeof b!="number"){
					return this
				}
				if(b<this.parentContainer.colors.min){
					b=this.parentContainer.colors.max
				}
				if(b>this.parentContainer.colors.max){
					b=this.parentContainer.colors.min
				}
				Travian.ajax({
					data:{
						cmd:"mapMultiMarkUpdate",
						data:{
							color:b,
							dataId:this.dataId,
							owner:this.parentContainer.parentContainer.typeId
						}
					},
					onSuccess:function(d){
						if(d){
							c.color=b;
							a(c);
							c.mapContainer.forceUpdateBlocksLayer("imageMark")
						}
					}
				});
				return this
			}
		})
	})();
	Travian.Game.Map.MapMark.Layer.Data.Flag=(function(){
		var a=function(b){
			b.elements.text.set("html",b.text);
			b.elements.index.set("html",'<img src="'+b.parentContainer.imgSource.substitute({index:b.index})+'" alt="" />')
		};
		return new Class({
			Extends:Travian.Game.Map.MapMark.Layer.Data,
			classType:"Travian.Game.Map.MapMark.Layer.Data.Flag",
			del:function(){
				var b=this;
				if(!this.editable){
					return this
				}
				Travian.ajax({
					data:{
						cmd:"mapFlagDelete",
						data:{
							dataId:this.dataId,
							owner:this.parentContainer.parentContainer.typeId
						}
					},
					onSuccess:function(c){
						if(c.result){
							b.destroy();
							b.dataStore.remove(Travian.Game.Map.DataStore.TYPE_SYMBOL,b.position,b.dataId);
							b.mapContainer.deleteSymbol({
								position:b.position,
								dataId:b.dataId
							});
							if(b.parentContainer.expanded){
								b.parentContainer.jScroll.refresh()
							}
						}
					}
				});
				return this
			},
			initialize:function(b,c){
				b.index=Number(b.index);
				this.parent(b,c)
			},
			render:function(b){
				var c=this;
				this.parent({
					index:"indexContainer",
					urlLink:"urlLink"
				});
				this.elements.index=this.element.down(".indexContainer");
				this.elements.urlLink=this.element.down(".urlLink");
				if(this.editable){
					this.elements.select.addEvent("click",function(d){
						c.parentContainer.showDialog({
							index:c.index,
							text:c.text,
							position:c.position,
							onOpen:function(g,h,f){
								h.down(".inputX").disabled=true;
								h.down(".inputY").disabled=true
							},
							onOkay:function(f,g,h){
								c.setIndex(f.index,f.text)
							}
						})
					})
				}
				this.elements.urlLink.addEvent("click",function(d){
					if(c.mapContainer.isEventsEnabled()){
						c.mapContainer.moveTo(c.position)
					}
				});
				a(this);
				return this
			},
			setIndex:function(b,d){
				var c=this;
				if(!this.editable){
					return this
				}
				if(typeof b!="number"){
					return this
				}
				if(b<this.parentContainer.indexes.min){
					b=this.parentContainer.indexes.max
				}
				if(b>this.parentContainer.indexes.max){
					b=this.parentContainer.indexes.min
				}
				Travian.ajax({
					data:{
						cmd:"mapFlagUpdate",
						data:{
							index:b,
							text:d,
							dataId:this.dataId,
							owner:this.parentContainer.parentContainer.typeId
						}
					},
					onSuccess:function(f){
						if(f){
							c.index=b;
							c.text=d;
							a(c);
							var g=c.dataStore.get(Travian.Game.Map.DataStore.TYPE_SYMBOL,c.position,c.dataId);
							g.index=c.index;
							g.text=c.text;
							c.dataStore.push({
								type:Travian.Game.Map.DataStore.TYPE_SYMBOL,
								position:c.position,
								index:c.dataId,
								data:g,
								time:false
							});
							c.mapContainer.updateSymbolData({
								position:c.position,
								dataId:c.dataId,
								index:c.index,
								text:c.text
							})
						}
					}
				});
				return this
			}
		})
	})();
	Travian.Game.Map.Options={};
	Travian.Game.Map.Options.Symbols={
		flag:{
			"class":Travian.Game.Map.Layer.Symbol.Flag,
			imgSource:"img/map/flag/flag-{index}/{width}x{height}.png",
			byUser:true,
			zIndex:10,
			visibleInZoom:{
				1:true,
				2:true,
				3:false,
				4:false
			},
			sizes:{
				1:{width:16,height:16},
				2:{width:10,height:10},
				3:{width:6,height:6},
				4:{width:4,height:4}
			}
		},
		attack:{
			"class":Travian.Game.Map.Layer.Symbol.Attack,
			imgSource:"img/map/attack/attack-{attackType}/{width}x{height}.gif",
			zIndex:10,
			visibleInZoom:{
				1:true,
				2:true,
				3:false,
				4:false
			},
			sizes:{
				1:{width:16,height:16},
				2:{width:10,height:10},
				3:{width:6,height:6},
				4:{width:4,height:4}
			}
		},
		battleGround:{
			"class":Travian.Game.Map.Layer.Symbol.BattleGround,
			imgSource:"img/map/battleground/battleground-{center}-{north}-{east}-{south}-{west}-{width}x{height}.png",
			zIndex:9,
			visibleInZoom:{
				1:true,
				2:true,
				3:false,
				4:false
			},
			sizes:{
				1:{width:16,height:16},
				2:{width:8,height:8},
				3:{width:4,height:4},
				4:{width:4,height:4}
			}
		},
		adventure:{
			"class":Travian.Game.Map.Layer.Symbol.Adventure,
			imgSource:"img/map/adventure/difficulty-{difficulty}/{width}x{height}.png",
			zIndex:10,
			visibleInZoom:{
				1:true,
				2:true,
				3:false,
				4:false
			},
			sizes:{
				1:{width:16,height:16},
				2:{width:8,height:8},
				3:{width:6,height:6},
				4:{width:4,height:4}
			}
		}
	};
	Travian.Game.Map.Options.Rulers={
		direction:null,
		imgSource:{
			x:"img/map/rulers/x-{zoomLevel}.gif",
			y:"img/map/rulers/y-{zoomLevel}.gif"
		},
		cls:{
			x:"ruler x",
			y:"ruler y"
		},
		steps:{
			x:{
				1:1,
				2:1,
				3:10,
				4:20
			},
			y:{
				1:1,
				2:1,
				3:10,
				4:20
			}
		},
		delta:{
			x:{
				1:0,
				2:0,
				3:0,
				4:0
			},
			y:{
				1:0,
				2:0,
				3:-9,
				4:-19
			}
		}
	};
	Travian.Game.Map.Options.MiniMap={
		container:"miniMap",
		containerContent:"minimapContainer",
		showToolTip:true,
		classLines:{
			x:"lines",
			y:"lines"
		},
		tooltipHtml:'<span class="xCoord">({x}</span><span class="pi">|</span><span class="yCoord">{y})</span><span class="clear"></span>'
	};
	Travian.Game.Map.Options.Toolbar={
		element:"toolbar",
		viewFullScreenUrl:"karte.php?fullscreen=1&x={x}&y={y}&zoom={zoom}",
		viewNormalUrl:"karte.php?x={x}&y={y}&zoom={zoom}",
		filterPlayer:{
			checked:true
		},
		filterAlliance:{
			checked:true
		}
	};
	Travian.Game.Map.Options.Outline={
		element:"outline"
	};
	Travian.Game.Map.Options.MapMark=Travian.Game.Map.Options.MapMark||{};
	Travian.Game.Map.Options.MapMark.Mark={
		"class":Travian.Game.Map.MapMark.Layer.Mark,
		title:"",
		typeId:"player",
		editable:true,
		expanded:false,
		color:0,
		colors:{
			0:"#C0C0C0",
			1:"#FF7722",
			2:"#B15BDB",
			3:"#DF4E78",
			4:"#34822F",
			5:"#3F90C5",
			6:"#C2AF09",
			7:"#8B1C1C",
			8:"#575BD2",
			9:"#4FE600",
			min:0,
			max:9
		},
		html:'<div class="title">{title} <a href="#" class="add {add}">+</a></div><div class="iconButton {expandButton} small"></div><div class="clear"></div><div class="{expandContainer}"><div class="{data}"></div></div>',
		dialog:{
			title:"",
			textOkay:"okay",
			textCancel:"cancel",
			textX:"X:",
			textY:"Y:",
			elementFocusNew:"coordinateDialogX",
			elementFocusEdit:"coordinateDialogX",
			html:'<div class="mapMarkMark"><div class="color {select}"></div><div class="{coord}"><span>{textX}</span><input id="coordinateDialogX" class="text coordinates x {inputX}" type="text" /><span>{textY}</span><input class="text coordinates y {inputY}" type="text" /></div><div class="{textDisplay}"></div></div>'},
			optionsData:{
				urlLink:"spieler.php?uid={markId}",
				html:'<div class="entry flag {entry}"><div class="marker color"><a href="#" class="{select} {color}"></a></div><div class="text"><a href="#" class="{urlLink} {text}"></a></div><div class="iconButton delete small {editDelete} {delete}"></div><div class="clear"></div></div>'
			}
		};
		Travian.Game.Map.Options.MapMark=Travian.Game.Map.Options.MapMark||{};
		Travian.Game.Map.Options.MapMark.Flag={
			"class":Travian.Game.Map.MapMark.Layer.Flag,
			title:"",
			editable:true,
			expanded:true,
			typeId:"flag",
			index:1,
			indexes:{
				min:1,
				max:20
			},
			imgSource:Travian.Game.Map.Options.Symbols.flag.imgSource.substitute({
				index:"{index}",
				zoomLevel:1,
				width:16,
				height:16
			}),
			html:'<div class="title">{title} <a href="#" class="add {add}">+</a></div><div class="iconButton {expandButton} small"></div><div class="clear"></div><div class="{expandContainer}"><div class="{data}"></div></div>',
			dialog:{
				title:"",
				textOkay:"okay",
				textCancel:"cancel",
				textX:"X:",
				textY:"Y:",
				elementFocusNew:"coordinateDialogX",
				elementFocusEdit:"coordinateDialogText",
				html:'<div class="mapMarkField"><div class="flag {select}"></div><div class="{coord}"><span>{textX}</span><input id="coordinateDialogX" class="text coordinates x {inputX}" type="text" /><span>{textY}</span><input class="text coordinates y {inputY}" type="text" /></div><div class="{textDisplay}"><input id="coordinateDialogText" class="text {inputText}" type="text" /></div></div>'},
				optionsData:{
					html:'<div class="entry flag {entry}"><div class="marker index"><a href="#" class="{select} {index}"></a></div><div class="text"><a href="#" class="{urlLink} {text}"></a></div><div class="iconButton delete small {editDelete} {delete}"></div><div class="clear"></div></div>'
				}
			};
			Travian.Game.Map.Options.Default={
				container:"mapContainer",
				containerViewSize:null,
				tileDisplayInformation:{
					type:"dialog",
					optionsPopup:{
						url:"position_details.php?x={x}&y={y}",
						windowOptions:{}
					},
					optionsDialog:{
						buttonOk:false,
						data:{
							cmd:"viewTileDetails",
							x:null,
							y:null
						}
					}
				},
				blockOverflow:1,
				blockSize:{
					width:170,
					height:150
				},
				mapInitialPosition:{
					x:0,
					y:0
				},
				grid:{
					1:"/img/map/grid/grid-1.gif",
					2:"/img/map/grid/grid-2.gif",
					3:"/img/map/grid/grid-3.gif",
					4:false
				},
				speeds:{
					slow:5,
					normal:20,
					fast:40
				},
				symbolTypes:Travian.Game.Map.Options.Symbols,
				onCreate:function(a){},
				onRender:function(a){
					(function(){
						Travian.Game.Map.Tips.render(a,a.containerMover);
						a.rulers=new Travian.Game.Map.Rulers(Travian.Game.Map.Options.Rulers,a);
						a.rulers.render();
						a.miniMap=new Travian.Game.Map.MiniMap(Travian.Game.Map.Options.MiniMap,a);
						a.miniMap.render();
						if(a.mapMarks){
							$each(a.mapMarks,function(b,c){
								if(b.enabled===true){
									a.mapMarks[c]=new Travian.Game.Map.MapMark(b,a)
								}else{
									delete (a.mapMarks[c])
								}
							})
						}
						a.outline=new Travian.Game.Map.Outline(Travian.Game.Map.Options.Outline,a);
						a.toolbar=new Travian.Game.Map.Toolbar(Travian.Game.Map.Options.Toolbar,a);
						a.toolbar.render()
					}).delay(500)
				},
				onMove:function(a,b){
					if(a.rulers){
						a.rulers.move(b)
					}
					if(a.miniMap){
						a.miniMap.move()
					}
				},
				onZoom:function(a){
					if(a.rulers){
						a.rulers.zoom()
					}
					if(a.miniMap){
						a.miniMap.zoom()
					}
					if(a.toolbar){
						a.toolbar.zoom()
					}
				}
			};
			Travian.Game.Map.Options.Default.contextMenu={
				targets:"#mapContainer",
				zIndex:2000,
				menu:"contextmenu",
				separators:[{
					selector:".separatorActions",
					elements:["#contextMenuSendTroops","#contextMenuSendTraders"]
				}],
				actions:[{
					element:"contextMenuSendTroops",
					displayOn:"did",
					fn:function(c,b,a){
						window.location.href="a2b.php?x="+a.position.x+"&y="+a.position.y
					}
				},{
					element:"contextMenuSendTraders",
					displayOn:"uid",
					fn:function(c,b,a){
						window.location.href="build.php?gid=17&x="+a.position.x+"&y="+a.position.y
					}
				},{
					element:"contextMenuMarkPlayerAlliance",
					displayOn:"aid",
					fn:function(c,b,a){
						c.parentContainer.mapMarks.player.layers.alliance.showDialog({position:b})
					}
				},{
					element:"contextMenuMarkPlayerPlayer",
					displayOn:"uid",
					fn:function(c,b,a){
						c.parentContainer.mapMarks.player.layers.player.showDialog({position:b})
					}
				},{
					element:"contextMenuFlagPlayer",
					displayOn:true,
					fn:function(c,b,a){
						c.parentContainer.mapMarks.player.layers.flag.showDialog({position:b})
					}
				},{
					element:"contextMenuMarkAllianceAlliance",
					displayOn:"aid",
					fn:function(c,b,a){
						c.parentContainer.mapMarks.alliance.layers.alliance.showDialog({position:b})
					}
				},{
					element:"contextMenuMarkAlliancePlayer",
					displayOn:"uid",
					fn:function(c,b,a){
						c.parentContainer.mapMarks.alliance.layers.player.showDialog({position:b})
					}
				},{
					element:"contextMenuFlagAlliance",
					displayOn:true,
					fn:function(c,b,a){
						c.parentContainer.mapMarks.alliance.layers.flag.showDialog({position:b})
					}
				}]
			};
			Travian.Game.Map.Options.Default.transition={
				onCreate:function(a){},
				onMove:function(a,b){},
				onZoom:function(a){},
				zoomOptions:{
					level:1,
					sizes:[{x:5,y:5},{x:10,y:10},{x:51,y:51},{x:135,y:135}]
				},
				border:{
					left:-400,
					top:-400,
					right:400,
					bottom:400
				}
			};
			Travian.Game.Map.Options.Default.layers=[{
				id:"loading",
				styles:{
					background:"#000000 url(img/loading.gif) center center no-repeat",
					opacity:0.5
				},
				"class":Travian.Game.Map.Layer.Loading,
				zIndex:20
			},{
				id:"image",
				src:"map_block.php?tx0={x}&ty0={y}&tx1={right}&ty1={bottom}&w={width}&h={height}&version={version}",
				srcInit:"img/x.gif",
				"class":Travian.Game.Map.Layer.Image,
				zIndex:1
			},{
				id:"imageMark",
				src:"map_mark.php?tx0={x}&ty0={y}&tx1={right}&ty1={bottom}&w={width}&h={height}&updates={forcedUpdates}",
				srcInit:"img/x.gif",
				"class":Travian.Game.Map.Layer.ImageMark,
				zIndex:2
			}];
			Travian.Game.Map.Options.Default.block={
				tooltipHtml:'<span class="xCoord">({x}</span><span class="pi">|</span><span class="yCoord">{y})</span><span class="clear"></span><br />{k.loadingData}'
			};
			Travian.Game.Map.Options.Default.updater={
				maxRequestCount:5,
				parameters:{
					multiple:{cmd:"mapInfo"},
					position:{cmd:"mapPositionData"}
				},
				requestDelayTime:{
					multiple:100,
					position:300
				},
				url:"ajax.php",
				elementWorking:"working",
				positionOptions:{
					areaAroundPosition:{
						1:{left:-5,top:-4,right:5,bottom:4},
						2:{left:-10,top:-8,right:10,bottom:8},
						3:{left:-25,top:-25,right:25,bottom:25},
						4:{left:-25,top:-25,right:25,bottom:25}
					}
				}
			};
			Travian.Game.Map.Options.Default.keyboard={
				37:"moveLeft",
				65:"moveLeft",
				100:!Browser.Engine.presto?"moveLeft":false,
				52:Browser.Engine.presto?"moveLeft":false,
				39:"moveRight",
				68:"moveRight",
				102:!Browser.Engine.presto?"moveRight":false,
				54:Browser.Engine.presto?"moveRight":false,
				38:"moveUp",
				87:"moveUp",
				104:!Browser.Engine.presto?"moveUp":false,
				56:Browser.Engine.presto?"moveUp":false,
				40:"moveDown",
				83:"moveDown",
				98:!Browser.Engine.presto?"moveDown":false,
				50:Browser.Engine.presto?"moveDown":false,
				61:"zoomIn",
				107:!Browser.Engine.presto?"zoomIn":false,
				43:Browser.Engine.presto?"zoomIn":false,
				109:"zoomOut",
				45:Browser.Engine.presto?"zoomOut":false,
				103:!Browser.Engine.presto?"moveLeftUp":false,
				55:Browser.Engine.presto?"moveLeftUp":false,
				97:!Browser.Engine.presto?"moveLeftDown":false,
				49:Browser.Engine.presto?"moveLeftDown":false,
				105:!Browser.Engine.presto?"moveRightUp":false,
				57:Browser.Engine.presto?"moveRightUp":false,
				99:!Browser.Engine.presto?"moveRightDown":false,
				51:Browser.Engine.presto?"moveRightDown":false,
				speed:{
					slow:"control",
					fast:"shift"
				},
				71:{
					fn:"toggleGrid",
					periodical:0
				},
				77:{
					fn:"toggleMiniMap",
					periodical:0
				},
				79:{
					fn:"toggleOutline",
					periodical:0
				}
			};
			Travian.Game.Map.Options.Default.dataStore={
				cachingTimeForType:{
					blocks:30*60*1000,
					symbol:10*60*1000,
					tile:10*60*1000,
					tooltip:2*60*1000
				},
				persistentStorage:false,
				useStorageForType:{
					blocks:false,
					symbol:false,
					tile:false,
					tooltip:true
				},
				clearStorageForType:{
					blocks:false,
					symbol:false,
					tile:false,
					tooltip:false
				}
			};
			Travian.Game.Map.Options.Default.data={elements:[]};
			Travian.Game.Map.Options.Default.mapMarks={
				player:{
					enabled:true,
					data:[],
					element:"tabPlayer",
					typeId:"player",
					layers:{
						alliance:$merge(Travian.Game.Map.Options.MapMark.Mark,{
							typeId:"alliance"
						}),
						player:$merge(Travian.Game.Map.Options.MapMark.Mark,{
							typeId:"player"
						}),
						flag:$merge(Travian.Game.Map.Options.MapMark.Flag,{
							indexes:{
								min:1,
								max:10
							}
						})
					}
				},
				alliance:{
					enabled:true,
					data:[],
					element:"tabAlliance",
					typeId:"alliance",
					layers:{
						alliance:$merge(Travian.Game.Map.Options.MapMark.Mark,{
							typeId:"alliance"
						}),
						player:$merge(Travian.Game.Map.Options.MapMark.Mark,{
							typeId:"player"
						}),
						flag:$merge(Travian.Game.Map.Options.MapMark.Flag,{
							indexes:{
								min:11,
								max:20
							}
						})
					}
				
				}
			};
function dellog(id){
	Travian.ajax({
		data:{
			cmd:"delLog",
			did:id
		},
		onSuccess:function(j){
			$('log'+id).style.display = 'none';
		}
	})
};
function newsManage(id,sts){
	Travian.ajax({
		data:{
			cmd:"NewsManage",
			id:id,
			status:sts
		},
		onSuccess:function(j){
			$('succes').style.display = 'block'
			
			if(sts == 0){
				$('nsts'+id).innerHTML = "<font color='red'>غیر فعال</font>";
			}else{
				$('nsts'+id).innerHTML = "<font color='green'>فعال</font>";
			}
		}
	})
};
var popupWidget=new Class({Implements:[Options,Events],options:{url:"",pop_bg:$("overlaybg"),pop_container:$$("popup"),close:$("pclose"),tour:false,insupport:false,anchorcheck:false},allowedAnchors:new Array("tutorial","moregames","impressum","spielregeln","links","agb","help","spielregeln","serverLogin","serverRegister"),initialize:function(a){this.setOptions(a);this.showPopup()},popcontent:function(){return $$(this.options.pop_container)[0].getChildren()[1]},showPopup:function(){var url=new URI(this.options.url);var anchor=url.get("fragment");var target=anchor+".php";if(url.get("query").length>0){target+="?"+url.get("query")}if(this.allowedAnchors.indexOf(anchor)==-1){if(this.options.anchorcheck==false){target=this.options.url}else{return}}var self=this;
var prevwindow=$$(this.options.pop_bg);var prevcontainer=$$(this.options.pop_container);var windowWidth=document.documentElement.clientWidth;prevcontainer[0].setStyles({display:"block",visibility:"hidden"});prevcontainer[0].className=anchor;var popupWidth=prevcontainer[0].getStyle("width").toInt();var left=windowWidth/2-popupWidth/2;prevwindow[0].setStyles({opacity:"0.7",display:"block",height:$(document).getScrollSize().y});var scroll=$(document.body).getScroll();prevcontainer[0].setStyles({left:windowWidth/2-popupWidth/2,top:scroll.y+100,visibility:"visible",display:"block"});self.popcontent().set("html",'<div class="loading"></div>');var req=new Request.HTML({url:target,evalScripts:false,onSuccess:function(html,responseElements,responseHTML,responseJavaScript){self.popcontent().set("text","");self.popcontent().adopt(html);if(anchor=="tutorial"){self.startTour()}if(self.options.insupport){self.startSupport()}if(responseJavaScript){eval(responseJavaScript)}},onFailure:function(){self.popcontent().set("text","The request failed.")
}});req.send();var close=$$(this.options.close);close.addEvent("click",function(){self.options.pop_container[0].setStyle("display","none");self.options.pop_bg.setStyle("display","none");this.removeEvents()});var bg=$$(this.options.pop_bg);bg.addEvent("click",function(){self.options.pop_container[0].setStyle("display","none");self.options.pop_bg.setStyle("display","none");this.removeEvents()})},startSupport:function(){$$(".spopcon").addEvent("click",function(a){a.stop();new popupWidget({pop_bg:$("overlaybg"),pop_container:$$("#popup"),close:$$(".pclose"),url:this.get("href"),tour:false,insupport:false})})},startTour:function(){var f=$$(this.popcontent())[0].getChildren()[1].getChildren("a.prev");var d=$$(this.popcontent())[0].getChildren()[1].getChildren("a.next");var c=$$(this.popcontent())[0].getChildren()[1].getChildren("a.prevtxt");var a=$$(this.popcontent())[0].getChildren()[1].getChildren("a.nexttxt");var b=this;if(d.get("href")[0].indexOf("tutorial.php")!=-1){d.addEvent("click",function(g){g.stop();
b.getTour(d.get("href"))});a.addEvent("click",function(g){g.stop();b.getTour(a.get("href"))})}f.addEvent("click",function(g){g.stop();b.getTour(f.get("href"))});c.addEvent("click",function(g){g.stop();b.getTour(c.get("href"))})},getTour:function(b){var a=this;a.popcontent().set("html",'<div class="loading"></div>');var c=new Request.HTML({url:b,evalScripts:false,onSuccess:function(d){a.popcontent().set("text","");a.popcontent().adopt(d);a.startTour()},onFailure:function(){a.popcontent().set("text","The request failed.")}});c.send()}});var sliderWidget=new Class({Implements:[Options,Events],options:{container:"",preview:true,inpreview:false,start:0,head:"",desc:"",prev_bg:"",prev_container:"",prev_stage_container:"",prev_items:"",close:"",pimgwidth:"",directcall:false},initialize:function(a){this.setOptions(a);if(!this.options.directcall){this.slideshow()}else{this.previewstart(0)}},stage:function(){return $$(this.options.container[0].getChildren(":nth-child(2)"))},belt:function(){return $$(this.stage()[0].getChildren(":nth-child(1)"))
},items:function(){return $$(this.belt().getChildren())},item:function(){return this.items()[0]},itemlength:function(){var b=this.item().getAttribute("width");if(b==null){b=this.item().getStyle("width").toInt()}if(b==0){b=520}b=parseInt(b);var c=this.item().getStyle("margin-left").toInt();var a=this.item().getStyle("margin-right").toInt();return b+c+a},beltlength:function(){var a=this.items().length*this.itemlength();this.belt().setStyle("width",a);return a},viewport:function(){return this.stage()[0].getStyle("width").toInt()},prevslide:function(){return $$(this.options.container[0].getChildren("a.prev"))},nextslide:function(){return $$(this.options.container[0].getChildren("a.next"))},index:function(){return this.options.start},slideshow:function(){var g=this.beltlength();var b=this.itemlength();var f=0;var a=this;var c=a.index();if(c=="0"){this.prevslide().removeClass("disabled");this.nextslide().addClass("disabled")}else{if(c==this.items().length-1){this.prevslide().addClass("disabled");
this.nextslide().removeClass("disabled")}else{this.prevslide().removeClass("disabled");this.nextslide().removeClass("disabled")}}if(this.options.inpreview){this.addHeader(c);this.adddescription(c);if(c!="0"){g=g-this.itemlength()*(c+1);b=b+this.itemlength()*(c-1);f=b-this.itemlength();var d=new Fx.Morph(a.belt()[0],{duration:"normal",transition:"sine:in:out"});d.start({left:"-"+b+"px"})}else{a.belt()[0].setStyle("left",0)}}this.prevslide().addEvent("click",function(){if(a.options.inpreview){c=c+1;a.addHeader(c);a.adddescription(c)}if(a.nextslide().hasClass("disabled")){a.nextslide().removeClass("disabled")}if(g==a.beltlength()){b=b;g=g-a.itemlength()}else{b=a.beltlength()-g}if(g>a.viewport()){var h=new Fx.Morph(a.belt()[0],{duration:"normal",transition:"sine:in:out"});var i={};if(Travian.getDirection()=="ltr"){i.left="-"+b+"px"}else{i.right="-"+b+"px"}h.start(i);g=g-a.itemlength();f=b-a.itemlength();if(g<a.viewport()){this.addClass("disabled")}}});this.nextslide().addEvent("click",function(){c=c-1;
if(a.options.inpreview){a.addHeader(c);a.adddescription(c)}if(a.prevslide().hasClass("disabled")){a.prevslide().removeClass("disabled")}if(f!="-"+a.itemlength()){var h=new Fx.Morph(a.belt()[0],{duration:"normal",transition:"sine:in:out"});var i={};if(Travian.getDirection()=="ltr"){i.left="-"+f+"px"}else{i.right="-"+f+"px"}h.start(i);f=f-a.itemlength();g=g+a.itemlength();if(f=="-"+a.itemlength()){this.addClass("disabled")}}});if(this.options.preview){this.items().each(function(i,h){i.addEvent("click",function(){a.previewstart(h)})})}},previewstart:function(b){var a=this;this.options.prev_items.empty();$each(screenshots,function(d){a.addImg(d.img)});var c=new sliderWidget({container:this.options.prev_stage_container,preview:false,inpreview:true,start:b,head:this.options.head,desc:this.options.desc,prev_bg:this.options.prev_bg,prev_container:this.options.prev_container,close:this.options.close,pimgwidth:this.options.pimgwidth});this.showPreview(c)},addImg:function(b){var a=new Element("img",{src:"img/x.gif","class":b,width:this.options.pimgwidth,height:397}).inject(this.options.prev_items)
},addHeader:function(a){this.options.head.getElement("h3").empty().appendText(screenshots[a].hl)},adddescription:function(a){this.options.desc.empty().appendText(screenshots[a].desc)},showPreview:function(g){var f=$$(g.options.prev_bg);var d=$$(g.options.prev_container);var b=document.documentElement.clientWidth;d[0].setStyles({display:"block",visibility:"hidden"});var c=d[0].getStyle("width").toInt();f[0].setStyles({opacity:"0.7",display:"block"});var a=$(document.body).getScroll();d[0].setStyles({left:b/2-c/2,top:a.y+100,visibility:"visible",display:"block"});var h=$(d[0]).getElement(".close");h.addEvent("click",function(){f[0].setStyle("display","none");d[0].setStyle("display","none");g.prevslide().removeEvents();g.nextslide().removeEvents()});f[0].addEvent("click",function(){f[0].setStyle("display","none");d[0].setStyle("display","none");g.prevslide().removeEvents();g.nextslide().removeEvents()})}});var stageWidget=new Class({Implements:[Options,Events],options:{stagebg:"",stagecon:[],stagenav:[],stagelink:[],stageduration:[],periodical:"",currentCounter:0,nextCounter:1,numberOfStages:3},initialize:function(a){this.setOptions(a);
this.stageshow();this.autoshow()},stageshow:function(){var a=this;this.options.stagenav.each(function(c,b){c.addEvents({mouseenter:function(){a.pauseshow();if(!this.hasClass("act"+b)){a.animateStage(b)}},mouseleave:function(d){if(d.relatedTarget!=null&&d.relatedTarget.className.substring()!="stage-content"){a.autoshow()}}})})},autoAnimateState:function(){this.animateStage();clearTimeout(this.options.timeout);var a=this.options.stageduration[this.options.currentCounter];this.options.timeout=this.autoAnimateState.delay(a,this)},animateStage:function(a){$each(this.options.stagenav,function(d,c){d.removeClass("act"+c)});$each(this.options.stagecon,function(c){c.removeClass("shown")});$each(this.options.stagelink,function(c){c.removeClass("shown")});if(typeof a==="undefined"){this.options.currentCounter=this.options.nextCounter;var b=this.options.nextCounter;this.options.nextCounter=(this.options.nextCounter+1)%this.options.numberOfStages}else{b=a;this.options.currentCounter=b;this.options.nextCounter=(b+1)%this.options.numberOfStages
}this.options.stagecon[b].setStyles({visibility:"hidden",opacity:0});this.options.stagebg.setStyles({visibility:"hidden",opacity:0});this.options.stagenav[b].addClass("act"+b).fade("in");this.options.stagecon[b].addClass("shown").fade("in");this.options.stagelink[b].addClass("shown").fade("in")},autoshow:function(){var a=this.options.stageduration[this.options.currentCounter];this.options.timeout=this.autoAnimateState.delay(a,this)},pauseshow:function(){clearTimeout(this.options.timeout)}});var tooltipWidget=new Class({Implements:[Options,Events],options:{tips:[],details:[]},initialize:function(a){this.setOptions(a);this.tooltip()},tooltip:function(){var a=this;this.options.tips.each(function(c,b){c.addEvents({mouseenter:function(){if(Travian.getDirection()=="ltr"){var g=this.offsetLeft+85}else{var g=this.offsetLeft-275}a.options.details[b].addClass("shown");var f=a.options.details[b].getSize();a.options.details[b].removeClass("shown");var d=this.offsetTop-f.y;a.options.details[b].setStyles({position:"absolute",left:g,top:d,visibility:"hidden",opacity:0});
if(!this.hasClass("shown")){a.options.details[b].addClass("shown").fade("in");this.addClass("act"+b)}},mouseleave:function(d){if(d.relatedTarget.className.substring(0,7)!="details"){a.options.details[b].removeClass("shown");this.removeClass("act"+b)}}})});this.options.details.each(function(c,b){c.addEvents({mouseleave:function(){this.removeClass("shown")}})})}});window.addEvent("domready",function(){$$(".popcon").addEvent("click",function(c){c.stop();new popupWidget({pop_bg:$("overlaybg"),pop_container:$$("#popup"),close:$$(".pclose"),url:this.get("href"),tour:this.get("href")=="#tutorial"?true:false,insupport:this.get("href")=="#help"?true:false})});var b=new URI();var a=b.get("fragment");if(a&&a=="screenshots"){}else{if(a){new popupWidget({pop_bg:$("overlaybg"),pop_container:$$("#popup"),close:$$(".pclose"),url:b.toString(),tour:a=="#tutorial"?true:false,insupport:a=="#help"?true:false,anchorcheck:true})}}});

