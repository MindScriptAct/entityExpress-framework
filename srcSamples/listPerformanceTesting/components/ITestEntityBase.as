package listPerformanceTesting.components {
public interface ITestEntityBase {

	function getNext():ITestEntityBase;

	function getNextUntyped():*;

	function getNextByClass(entityClass:Class):*;

}
}
