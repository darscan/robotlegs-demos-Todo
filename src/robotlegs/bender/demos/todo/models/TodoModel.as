//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.demos.todo.models
{
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.ListCollectionView;

	public class TodoModel
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		private const _items:ArrayCollection = new ArrayCollection();

		public function get items():ArrayCollection
		{
			return _items;
		}

		private const _doneItems:ListCollectionView = new ListCollectionView(_items);

		public function get doneItems():IList
		{
			return _doneItems;
		}

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		public function TodoModel()
		{
			_doneItems.filterFunction = completedFilter;
		}

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		public function addItem(note:String):void
		{
			_items.addItem(new TodoItem(note));
			_doneItems.refresh();
		}

		public function removeItem(item:TodoItem):void
		{
			const index:int = _items.getItemIndex(item);
			if (index >= 0)
				_items.removeItemAt(index);
			_doneItems.refresh();
		}

		public function markAll(done:Boolean):void
		{
			for each (var item:TodoItem in _items)
				item.done = done;
			_doneItems.refresh();
		}

		public function clearCompleted():void
		{
			_items.source = _items.source.filter(function(item:TodoItem, ... rest):Boolean {
				return !item.done;
			});
			_doneItems.refresh();
		}

		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/

		private function completedFilter(item:TodoItem):Boolean
		{
			return item.done;
		}
	}
}
