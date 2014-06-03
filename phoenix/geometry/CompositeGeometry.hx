package phoenix.geometry;

import phoenix.geometry.Geometry;
import phoenix.Batcher;
import phoenix.Quaternion;
import phoenix.Shader;
import phoenix.Texture;

class CompositeGeometry extends Geometry {

    public var geometry : Array<Geometry>;

    public function new(?options:Dynamic = null) {

        super(options);

        transform.pos_changed = set_pos_from_transform;
        transform.scale_changed = set_scale_from_transform;
        transform.origin_changed = set_origin_from_transform;
        transform.rotation_changed = set_rotation_from_transform;

        geometry = new Array<Geometry>();

    } //new

    public function toString() {
        return "CompositeGeometry " + geometry + ' : ' + Std.string(geometry);
    }

    public function clear() {

            //:todo: profile these splices vs new assigns in haxe
        geometry.splice(0,geometry.length);

    } //clear

        //loses the old geometry for new geometry
    public function replace(_geometry:Array<Geometry>) {

            //remove references 
        clear();
            //store the new geometry
        geometry = _geometry;

    } //replace

    public function has_geometry( g:Geometry ) {

        return Lambda.has(geometry, g);

    } //has_geometry

    public function add_geometry( g:Geometry ) {

        geometry.push(g);

    } //add_geometry

    public function remove_geometry( g:Geometry ) {

        geometry.remove(g);

    } //remove_geometry

    public function add_to_batcher( _batcher:Batcher ) {
        for(geom in geometry) {
            _batcher.add(geom);
        }
    }

    public override function drop( ?remove:Bool = true ) {

        for(geom in geometry) {
            geom.drop( remove );
        }

        geometry.splice(0,geometry.length);

    } //drop

    public override function translate( _offset:Vector ) {        
        if(geometry != null) {
            for(geom in geometry) {
                geom.translate(_offset);
            }
        }
    } //translate

    function set_origin_from_transform( _origin:Vector ) : Void {
        if(geometry != null) {
            for(geom in geometry) {
                geom.transform.origin = _origin;
            }
        }
    } //set_origin

    function set_pos_from_transform( _position:Vector ) {
        if(geometry != null) {
            for(geom in geometry) {
                geom.transform.pos = _position;
            }
        }
    } //set_pos

    function set_rotation_from_transform( _rotation:Quaternion ) {
        if(geometry != null) {
            for(geom in geometry) {
                geom.transform.rotation = _rotation;
            }
        }
    } //set_rotation

    function set_scale_from_transform( _scale:Vector ) {
        if(geometry != null) {
            for(geom in geometry) {
                geom.transform.scale = _scale;
            }
        }
    } //set_scale

    public override function set_color( _color:Color ) : Color {
        if(geometry != null) {
            for(geom in geometry) {
                geom.color = _color;
            }
        }
        return color = _color;
    } //set_color

    public override function set_primitive_type(val : PrimitiveType) : PrimitiveType {
        if(geometry != null) {
            for(geom in geometry) {
                geom.primitive_type = val;
            }
        }
        return primitive_type = val;
    } //set_primitive_type

    public override function set_shader(val : Shader) : Shader {
        if(geometry != null) {
            for(geom in geometry) {
                geom.shader = val;
            }
        }
        return shader = val;
    } //set_shader

    public override function set_texture(val : Texture) : Texture {
        if(geometry != null) {
            for(geom in geometry) {
                geom.texture = val;
            }
        }
        return texture = val;
    } //set_texture

    public override function set_depth(val : Float) : Float {  
        if(geometry != null) {
            for(geom in geometry) {
                geom.depth = val;
            }
        }
        return depth = val;
    } //set_depth

    public override function set_group(val : Int) : Int {   
        if(geometry != null) {     
            for(geom in geometry) {
                geom.group = val;
            }
        }
        return group = val;
    } //set_group

    public override function set_clip(val : Bool) : Bool {
        if(geometry != null) {
            for(geom in geometry) {
                geom.clip = val;
            }
        }
        return clip = val;
    } //set_clip

    public override function set_locked(val : Bool) : Bool {
        if(geometry != null) {
            for(geom in geometry) {
                geom.locked = val;
            }
        }
        return locked = val;
    } //set_locked

    public override function set_dirty(val : Bool) : Bool {
        if(geometry != null) {
            for(geom in geometry) {
                geom.dirty = val;
            }
        }
        return dirty = val;
    } //set_dirty

    public override function set_clip_rect(val : Rectangle) : Rectangle {
        if(geometry != null) {
            for(geom in geometry) {
                geom.clip_rect = val;
            }
        }
        return clip_rect = val;
    } //set_clip_rect

    public override function set_visible(val : Bool) : Bool {

        if(geometry != null) {
            for(geom in geometry) {
                geom.visible = val;
            }
        }

        return visible = val;
    } //set_visible

} //CompositeGeometry
