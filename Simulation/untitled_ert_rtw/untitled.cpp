//
// File: untitled.cpp
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
#include "untitled.h"
#include "untitled_private.h"

// Model step function
void untitledModelClass::step()
{
  SL_Bus_untitled_geometry_msgs_Point rtb_BusAssignment;
  real_T rtb_BusAssignment_tmp_tmp;

  // Sin: '<Root>/Sine Wave' incorporates:
  //   Sin: '<Root>/Sine Wave2'

  rtb_BusAssignment_tmp_tmp = std::sin((&untitled_M)->Timing.t[0]);

  // BusAssignment: '<Root>/Bus Assignment' incorporates:
  //   Sin: '<Root>/Sine Wave'

  rtb_BusAssignment.X = rtb_BusAssignment_tmp_tmp * 10.0;
  rtb_BusAssignment.Y = rtb_BusAssignment_tmp_tmp;
  rtb_BusAssignment.Z = rtb_BusAssignment_tmp_tmp;

  // Outputs for Atomic SubSystem: '<Root>/Publish'
  // MATLABSystem: '<S2>/SinkBlock'
  Pub_untitled_1.publish(&rtb_BusAssignment);

  // End of Outputs for SubSystem: '<Root>/Publish'

  // Outputs for Atomic SubSystem: '<Root>/Subscribe'
  // MATLABSystem: '<S3>/SourceBlock'
  Sub_untitled_10.getLatestMessage(&rtb_BusAssignment);

  // End of Outputs for SubSystem: '<Root>/Subscribe'

  // Update absolute time for base rate
  // The "clockTick0" counts the number of times the code of this task has
  //  been executed. The absolute time is the multiplication of "clockTick0"
  //  and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
  //  overflow during the application lifespan selected.

  (&untitled_M)->Timing.t[0] =
    ((time_T)(++(&untitled_M)->Timing.clockTick0)) * (&untitled_M)
    ->Timing.stepSize0;

  {
    // Update absolute timer for sample time: [0.2s, 0.0s]
    // The "clockTick1" counts the number of times the code of this task has
    //  been executed. The resolution of this integer timer is 0.2, which is the step size
    //  of the task. Size of "clockTick1" ensures timer will not overflow during the
    //  application lifespan selected.

    (&untitled_M)->Timing.clockTick1++;
  }
}

// Model initialize function
void untitledModelClass::initialize()
{
  // Registration code
  {
    // Setup solver object
    rtsiSetSimTimeStepPtr(&(&untitled_M)->solverInfo, &(&untitled_M)
                          ->Timing.simTimeStep);
    rtsiSetTPtr(&(&untitled_M)->solverInfo, &rtmGetTPtr((&untitled_M)));
    rtsiSetStepSizePtr(&(&untitled_M)->solverInfo, &(&untitled_M)
                       ->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&(&untitled_M)->solverInfo, (&rtmGetErrorStatus
      ((&untitled_M))));
    rtsiSetRTModelPtr(&(&untitled_M)->solverInfo, (&untitled_M));
  }

  rtsiSetSimTimeStep(&(&untitled_M)->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&(&untitled_M)->solverInfo,"FixedStepDiscrete");
  rtmSetTPtr((&untitled_M), &(&untitled_M)->Timing.tArray[0]);
  (&untitled_M)->Timing.stepSize0 = 0.2;

  {
    int32_T i;
    char_T b_zeroDelimTopic[10];
    char_T b_zeroDelimTopic_tmp[10];
    static const char_T tmp[9] = { '/', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n' };

    // SystemInitialize for Atomic SubSystem: '<Root>/Publish'
    // Start for MATLABSystem: '<S2>/SinkBlock' incorporates:
    //   MATLABSystem: '<S3>/SourceBlock'

    untitled_DW.obj.matlabCodegenIsDeleted = false;
    untitled_DW.obj.isInitialized = 1;

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe'
    for (i = 0; i < 9; i++) {
      b_zeroDelimTopic_tmp[i] = tmp[i];
    }

    b_zeroDelimTopic_tmp[9] = '\x00';

    // End of SystemInitialize for SubSystem: '<Root>/Subscribe'
    for (i = 0; i < 10; i++) {
      b_zeroDelimTopic[i] = b_zeroDelimTopic_tmp[i];
    }

    Pub_untitled_1.createPublisher(&b_zeroDelimTopic[0], 1);
    untitled_DW.obj.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S2>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Publish'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe'
    // Start for MATLABSystem: '<S3>/SourceBlock'
    untitled_DW.obj_n.matlabCodegenIsDeleted = false;
    untitled_DW.obj_n.isInitialized = 1;
    Sub_untitled_10.createSubscriber(&b_zeroDelimTopic_tmp[0], 1);
    untitled_DW.obj_n.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<Root>/Subscribe'
  }
}

// Model terminate function
void untitledModelClass::terminate()
{
  // Terminate for Atomic SubSystem: '<Root>/Publish'
  // Terminate for MATLABSystem: '<S2>/SinkBlock'
  if (!untitled_DW.obj.matlabCodegenIsDeleted) {
    untitled_DW.obj.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S2>/SinkBlock'
  // End of Terminate for SubSystem: '<Root>/Publish'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe'
  // Terminate for MATLABSystem: '<S3>/SourceBlock'
  if (!untitled_DW.obj_n.matlabCodegenIsDeleted) {
    untitled_DW.obj_n.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S3>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe'
}

// Constructor
untitledModelClass::untitledModelClass() :
  untitled_DW(),
  untitled_M()
{
  // Currently there is no constructor body generated.
}

// Destructor
untitledModelClass::~untitledModelClass()
{
  // Currently there is no destructor body generated.
}

// Real-Time Model get method
untitledModelClass::RT_MODEL_untitled_T * untitledModelClass::getRTM()
{
  return (&untitled_M);
}

//
// File trailer for generated code.
//
// [EOF]
//
