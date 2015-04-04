// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package entityExpress.vos {

/**
 * FOR INTERNAL USE ONLY.
 * Value Object to keep injection rules - what have to be injected where.
 * @private
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 *
 * @version 2.0.rc1
 */
public class ComponentInjectRuleVO {

	/** FOR INTERNAL USE ONLY. Name of variable to inject object into. */
	public var varName:String;

	/** FOR INTERNAL USE ONLY. Injection identifier, formed by class name and your custom inject name. */
	public var injectId:String;

	/** FOR INTERNAL USE ONLY. Injection class*/
	public var injectClass:Class;

	CONFIG::debug
	public function toString():String {
		return "[ComponentInjectRuleVO varName=" + varName + " injectId=" + injectId + "]";
	}
}
}