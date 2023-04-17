//
// File: untitled.h
//
// Code generated for Simulink model 'untitled'.
//
// Model version                  : 1.0
// Simulink Coder version         : 9.5 (R2021a) 14-Nov-2020
// C/C++ source code generated on : Sun Apr  2 09:21:44 2023
//
// Target selection: ert.tlc
// Embedded hardware selection: Intel->x86-64 (Windows64)
// Code generation objectives: Unspecified
// Validation result: Not run
//
#ifndef RTW_HEADER_untitled_h_
#define RTW_HEADER_untitled_h_
#include <cmath>
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "slros_initialize.h"
#include "untitled_types.h"

// Macros for accessing real-time model data structure
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                ((rtm)->Timing.t)
#endif

// Class declaration for model untitled
class untitledModelClass {
  // public data and function members
 public:
  // Block states (default storage) for system '<Root>'
  struct DW_untitled_T {
    ros_slroscpp_internal_block_P_T obj;// '<S2>/SinkBlock'
    ros_slroscpp_internal_block_S_T obj_n;// '<S3>/SourceBlock'
  };

  // Real-time Model Data Structure
  struct RT_MODEL_untitled_T {
    const char_T *errorStatus;
    RTWSolverInfo solverInfo;

    //
    //  Timing:
    //  The following substructure contains information regarding
    //  the timing information for the model.

    struct {
      uint32_T clockTick0;
      time_T stepSize0;
      uint32_T clockTick1;
      SimTimeStep simTimeStep;
      time_T *t;
      time_T tArray[2];
    } Timing;
  };

  // model initialize function
  void initialize();

  // model step function
  void step();

  // model terminate function
  void terminate();

  // Constructor
  untitledModelClass();

  // Destructor
  ~untitledModelClass();

  // Real-Time Model get method
  untitledModelClass::RT_MODEL_untitled_T * getRTM();

  // private data and function members
 private:
  // Block states
  DW_untitled_T untitled_DW;

  // Real-Time Model
  RT_MODEL_untitled_T untitled_M;
};

//-
//  These blocks were eliminated from the model due to optimizations:
//
//  Block '<Root>/Scope' : Unused code path elimination


//-
//  The generated code includes comments that allow you to trace directly
//  back to the appropriate location in the model.  The basic format
//  is <system>/block_name, where system is the system number (uniquely
//  assigned by Simulink) and block_name is the name of the block.
//
//  Use the MATLAB hilite_system command to trace the generated code back
//  to the model.  For example,
//
//  hilite_system('<S3>')    - opens system 3
//  hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
//
//  Here is the system hierarchy for this model
//
//  '<Root>' : 'untitled'
//  '<S1>'   : 'untitled/Blank Message'
//  '<S2>'   : 'untitled/Publish'
//  '<S3>'   : 'untitled/Subscribe'
//  '<S4>'   : 'untitled/Subscribe/Enabled Subsystem'

#endif                                 // RTW_HEADER_untitled_h_

//
// File trailer for generated code.
//
// [EOF]
//
