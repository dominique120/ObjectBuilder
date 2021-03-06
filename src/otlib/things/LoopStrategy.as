///////////////////////////////////////////////////////////////////////////////////
// 
//  Copyright (c) 2015 <https://github.com/Mignari/ObjectBuilder/graphs/contributors>
// 
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
// 
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
// 
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
///////////////////////////////////////////////////////////////////////////////////

package otlib.things
{
    import otlib.resources.Resources;

    public class LoopStrategy implements IFrameStrategy
    {
        //--------------------------------------------------------------------------
        // PROPERTIES
        //--------------------------------------------------------------------------
        
        public var loopCount:uint;
        public var currentLoop:uint;
        
        //--------------------------------------------------------------------------
        // CONSTRUCTOR
        //--------------------------------------------------------------------------
        
        public function LoopStrategy()
        {
        }
        
        //--------------------------------------------------------------------------
        // METHODS
        //--------------------------------------------------------------------------
        
        //--------------------------------------
        // Public
        //--------------------------------------
        
        public function toString():String
        {
            return Resources.getString("loop");
        }
        
        public function getNextFrame(currentFrame:uint, totalFrames:uint):uint
        {
            var nextFrame:uint = (currentFrame + 1);
            if (nextFrame < totalFrames)
                return nextFrame;
            
            if (loopCount == 0)
                return 0;
            
            if (currentLoop < (loopCount - 1)) {
                currentLoop++;
                return 0;
            }
            
            return currentFrame;
        }
        
        public function clone():IFrameStrategy
        {
            var clone:LoopStrategy = new LoopStrategy();
            clone.loopCount = this.loopCount;
            clone.currentLoop = this.currentLoop;
            return clone;
        }
        
        public function reset():void
        {
            currentLoop = 0;
        }
    }
}
