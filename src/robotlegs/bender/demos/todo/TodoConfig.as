//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.demos.todo
{
	import org.swiftsuspenders.Injector;

	import robotlegs.bender.demos.todo.models.TodoModel;
	import robotlegs.bender.demos.todo.views.TodoItemRenderer;
	import robotlegs.bender.demos.todo.views.TodoItemRendererMediator;
	import robotlegs.bender.demos.todo.views.TodoMediator;
	import robotlegs.bender.demos.todo.views.TodoPM;
	import robotlegs.bender.demos.todo.views.TodoView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	public class TodoConfig implements IConfig
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		[Inject]
		public var injector:Injector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		public function configure():void
		{
			injector.map(TodoModel).asSingleton();
			injector.map(TodoPM).asSingleton();
			mediatorMap.map(TodoView).toMediator(TodoMediator);
			mediatorMap.map(TodoItemRenderer).toMediator(TodoItemRendererMediator);
		}
	}
}
