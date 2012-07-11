//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.demos.todo.views
{
	import flash.events.Event;
	import mx.collections.IList;
	import mx.events.CollectionEvent;
	import robotlegs.bender.demos.todo.models.TodoItem;
	import robotlegs.bender.demos.todo.models.TodoModel;

	public class TodoPM
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		[Inject]
		public var todoModel:TodoModel;

		[Bindable]
		public var currentNote:String;

		[Bindable]
		public var items:IList;

		[Bindable]
		public var doneItems:IList;

		private var _allDone:Boolean;

		[Bindable(event="allDoneChange")]
		public function get allDone():Boolean
		{
			return _allDone;
		}

		public function set allDone(value:Boolean):void
		{
			todoModel.markAll(value);
		}

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		[PostConstruct]
		public function init():void
		{
			items = todoModel.items;
			doneItems = todoModel.doneItems;
			doneItems.addEventListener(CollectionEvent.COLLECTION_CHANGE, onCollectionChange)
		}

		public function addTodo():void
		{
			if (currentNote)
			{
				todoModel.addItem(currentNote);
				currentNote = '';
			}
		}

		public function removeTodo(item:TodoItem):void
		{
			todoModel.removeItem(item);
		}

		public function clearCompleted():void
		{
			todoModel.clearCompleted();
		}

		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/

		private function onCollectionChange(event:CollectionEvent):void
		{
			const allDone:Boolean =
				items.length == todoModel.doneItems.length;
			if (allDone != _allDone)
			{
				_allDone = allDone;
				dispatchEvent(new Event('allDoneChange'));
			}
		}
	}
}
