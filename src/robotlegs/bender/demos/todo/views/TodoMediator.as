//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.demos.todo.views
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	public class TodoMediator extends Mediator
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		[Inject]
		public var view:TodoView;

		[Inject]
		public var todoPM:TodoPM;

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		override public function initialize():void
		{
			view.todoPM = todoPM;
		}
	}
}
