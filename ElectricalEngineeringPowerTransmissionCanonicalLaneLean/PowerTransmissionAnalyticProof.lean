import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringPowerTransmissionCanonicalLaneLean.PowerSystemModel
import ElectricalEngineeringPowerTransmissionCanonicalLaneLean.LoadFlowAnalysis
import ElectricalEngineeringPowerTransmissionCanonicalLaneLean.FaultAnalysis
import ElectricalEngineeringPowerTransmissionCanonicalLaneLean.TransientStability

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure PowerTransmissionAnalyticFoundation where
  model : PowerSystemModelPackage
  modelEvidence : PowerSystemModelEvidence model
  loadFlow : LoadFlowPackage model
  loadFlowEvidence : LoadFlowEvidence loadFlow
  fault : FaultAnalysisPackage model
  faultEvidence : FaultAnalysisEvidence fault
  stability : TransientStabilityPackage model
  stabilityEvidence : TransientStabilityEvidence stability

def PowerTransmissionAnalyticFoundationClosed (A : PowerTransmissionAnalyticFoundation) : Prop :=
  PowerSystemModelClosed A.model ∧
  LoadFlowClosed A.loadFlow ∧
  FaultAnalysisClosed A.fault ∧
  TransientStabilityClosed A.stability

theorem power_transmission_analytic_foundation_closed_from_evidence
    (A : PowerTransmissionAnalyticFoundation) :
    PowerTransmissionAnalyticFoundationClosed A := by
  exact And.intro (power_system_model_closed_from_evidence A.model A.modelEvidence)
    (And.intro (load_flow_closed_from_evidence A.loadFlow A.loadFlowEvidence)
      (And.intro (fault_analysis_closed_from_evidence A.fault A.faultEvidence)
        (transient_stability_closed_from_evidence A.stability A.stabilityEvidence)))

end HautevilleHouse
end ElectricalEngineeringPowerTransmissionCanonicalLaneLean