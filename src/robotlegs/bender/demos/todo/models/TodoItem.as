//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.demos.todo.models
{

	[Bindable]
	public class TodoItem
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		public var done:Boolean;

		public var note:String;

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		public function TodoItem(note:String)
		{
			this.note = note;
		}
	}
}
